/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <WCDB/database.hpp>
#include <WCDB/handle_statement.hpp>
#include <WCDB/macro.hpp>
#include <WCDB/timed_queue.hpp>
#include <WCDB/utility.hpp>
#include <queue>
#include <sqlcipher/sqlite3.h>
#include <thread>
#include <vector>

namespace WCDB {

const std::string Database::defaultConfigName = "default";
const std::string Database::defaultCipherConfigName = "cipher";
const std::string Database::defaultTraceConfigName = "trace";
const std::string Database::defaultCheckpointConfigName = "checkpoint";
const std::string Database::defaultSyncName = "sync";
std::shared_ptr<Trace> Database::s_globalTrace = nullptr;

static const Config s_checkpointConfig = [](std::shared_ptr<Handle> &handle,
                                            Error &error) -> bool {
    handle->registerCommitedHook(
        [](Handle *handle, int pages, void *) {
            static TimedQueue<std::string> s_timedQueue(2);
            if (pages > 1000) {
                s_timedQueue.reQueue(handle->path);
            }
            static std::thread s_checkpointThread([]() {
                pthread_setname_np(
                    ("WCDB-" + Database::defaultCheckpointConfigName).c_str());
                while (true) {
                    s_timedQueue.waitUntilExpired([](const std::string &path) {
                        Database database(path);
                        WCDB::Error innerError;
                        database.exec(
                            StatementPragma().pragma(Pragma::WalCheckpoint),
                            innerError);
                    });
                }
            });
            static std::once_flag s_flag;
            std::call_once(s_flag, []() { s_checkpointThread.detach(); });
        },
        nullptr);
    return true;
};

const Configs Database::defaultConfigs(
    {{
         Database::defaultTraceConfigName,
         [](std::shared_ptr<Handle> &handle, Error &error) -> bool {
             std::shared_ptr<Trace> trace = s_globalTrace;
             if (trace) {
                 handle->setTrace(*trace.get());
             }
             return true;
         },
         0,
     },
     {
         Database::defaultCipherConfigName,
         [](std::shared_ptr<Handle> &handle, Error &error) -> bool {
             //place holder
             return true;
         },
         1,
     },
     {
         Database::defaultConfigName,
         [](std::shared_ptr<Handle> &handle, Error &error) -> bool {

             //Locking Mode
             {
                 static const StatementPragma s_getLockingMode =
                     StatementPragma().pragma(Pragma::LockingMode);
                 static const StatementPragma s_setLockingModeNormal =
                     StatementPragma().pragma(Pragma::LockingMode, "NORMAL");

                 //Get Locking Mode
                 std::shared_ptr<StatementHandle> statementHandle =
                     handle->prepare(s_getLockingMode);
                 if (!statementHandle) {
                     error = handle->getError();
                     return false;
                 }
                 statementHandle->step();
                 if (!statementHandle->isOK()) {
                     error = statementHandle->getError();
                     return false;
                 }
                 std::string lockingMode =
                     statementHandle->getValue<WCDB::ColumnType::Text>(0);
                 statementHandle->finalize();

                 //Set Locking Mode
                 if (strcasecmp(lockingMode.c_str(), "NORMAL") != 0 &&
                     !handle->exec(s_setLockingModeNormal)) {
                     error = handle->getError();
                     return false;
                 }
             }

             //Synchronous
             {
                 static const StatementPragma s_setSynchronousFull =
                     StatementPragma().pragma(Pragma::Synchronous, "NORMAL");

                 if (!handle->exec(s_setSynchronousFull)) {
                     error = handle->getError();
                     return false;
                 }
             }

             //Journal Mode
             {
                 static const StatementPragma s_getJournalMode =
                     StatementPragma().pragma(Pragma::JournalMode);
                 static const StatementPragma s_setJournalModeWAL =
                     StatementPragma().pragma(Pragma::JournalMode, "WAL");

                 //Get Journal Mode
                 std::shared_ptr<StatementHandle> statementHandle =
                     handle->prepare(s_getJournalMode);
                 if (!statementHandle) {
                     error = handle->getError();
                     return false;
                 }
                 statementHandle->step();
                 if (!statementHandle->isOK()) {
                     error = statementHandle->getError();
                     return false;
                 }
                 std::string journalMode =
                     statementHandle->getValue<WCDB::ColumnType::Text>(0);
                 statementHandle->finalize();

                 //Set Journal Mode
                 if (strcasecmp(journalMode.c_str(), "WAL") != 0 &&
                     !handle->exec(s_setJournalModeWAL)) {
                     error = handle->getError();
                     return false;
                 }
             }

             error.reset();
             return true;
         },
         2,
     },
     {
         Database::defaultSyncName,
         nullptr, //placeholder
         3,
     },
     {
         Database::defaultCheckpointConfigName,
         s_checkpointConfig, //checkpoint opti
         4,
     }});

void Database::setConfig(const std::string &name,
                         const Config &config,
                         Configs::Order order)
{
    m_pool->setConfig(name, config, order);
}

void Database::setConfig(const std::string &name, const Config &config)
{
    m_pool->setConfig(name, config);
}

void Database::setCipherKey(const void *key, int size)
{
    std::shared_ptr<std::vector<unsigned char>> keys(
        new std::vector<unsigned char>(size));
    memcpy(keys->data(), key, size);
    m_pool->setConfig(
        Database::defaultCipherConfigName,
        [keys](std::shared_ptr<Handle> &handle, Error &error) -> bool {

            bool result =
                handle->setCipherKey(keys->data(), (int) keys->size());

            //Page Size
            {
                static const StatementPragma s_getCipherPageSize =
                    StatementPragma().pragma(Pragma::CipherPageSize);
                static const StatementPragma s_setCipherPageSize =
                    StatementPragma().pragma(Pragma::CipherPageSize, 4096);

                //Get Page Size
                std::shared_ptr<StatementHandle> statementHandle =
                    handle->prepare(s_getCipherPageSize);
                if (!statementHandle) {
                    error = handle->getError();
                    return false;
                }
                statementHandle->step();
                if (!statementHandle->isOK()) {
                    error = statementHandle->getError();
                    return false;
                }
                int cipherPageSize =
                    statementHandle->getValue<WCDB::ColumnType::Integer32>(0);
                statementHandle->finalize();

                //Set Page Size
                if (cipherPageSize != 4096 &&
                    !handle->exec(s_setCipherPageSize)) {
                    error = handle->getError();
                    return false;
                }
            }

            error = handle->getError();
            return result;
        });
}

void Database::setTrace(const Trace &trace)
{
    m_pool->setConfig(
        Database::defaultTraceConfigName,
        [trace](std::shared_ptr<Handle> &handle, Error &error) -> bool {
            handle->setTrace(trace);
            return true;
        });
}

void Database::setSyncEnabled(bool sync)
{
    if (sync) {
        m_pool->setConfig(
            Database::defaultSyncName,
            [](std::shared_ptr<Handle> &handle, Error &error) -> bool {

                //Synchronous
                {
                    static const StatementPragma s_setSynchronousFull =
                        StatementPragma().pragma(Pragma::Synchronous, "FULL");

                    if (!handle->exec(s_setSynchronousFull)) {
                        error = handle->getError();
                        return false;
                    }
                }

                //Checkpoint Fullfsync
                {
                    static const StatementPragma s_setCheckpointFullfsync =
                        StatementPragma().pragma(Pragma::CheckpointFullfsync,
                                                 true);

                    if (!handle->exec(s_setCheckpointFullfsync)) {
                        error = handle->getError();
                        return false;
                    }
                }

                //Fullfsync
                {
                    static const StatementPragma s_setFullFsync =
                        StatementPragma().pragma(Pragma::Fullfsync, true);

                    if (!handle->exec(s_setFullFsync)) {
                        error = handle->getError();
                        return false;
                    }
                }

                error.reset();
                return true;
            });
        //disable checkpoint opti for sync
        m_pool->setConfig(Database::defaultCheckpointConfigName, nullptr);
    } else {
        m_pool->setConfig(Database::defaultSyncName, nullptr);
        m_pool->setConfig(Database::defaultCheckpointConfigName,
                          s_checkpointConfig);
    }
}

void Database::SetGlobalTrace(const Trace &globalTrace)
{
    s_globalTrace.reset(new Trace(globalTrace));
}

} //namespace WCDB
