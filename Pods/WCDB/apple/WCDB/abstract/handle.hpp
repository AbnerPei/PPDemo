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

#ifndef handle_hpp
#define handle_hpp

#include <WCDB/declare.hpp>
#include <WCDB/error.hpp>
#include <WCDB/handle_statement.hpp>
#include <WCDB/utility.hpp>
#include <map>
#include <memory>
#include <mutex>
#include <string>

namespace WCDB {

//{{sql->count}, cost}
typedef std::function<void(
    Tag, const std::map<std::string, unsigned int> &, const int64_t &)>
    Trace;

typedef std::function<void(Handle *, int, void *)> CommitedHook;

class Handle {
public:
    Handle(const std::string &path);
    ~Handle();
    const std::string path;

    void setTag(Tag tag);
    Tag getTag() const;

    std::shared_ptr<StatementHandle> prepare(const Statement &statement);
    bool exec(const Statement &statement);

    bool open();
    void close();

    bool isTableExists(const std::string &tableName);
    bool setCipherKey(const void *data, int size);
    long long getLastInsertedRowID();

    enum class Config : int {
        Fts3Tokenizer,
    };
    void setConfig(Config config, bool enable);

    void setTrace(const Trace &trace);

    bool backup(const void *key = nullptr, const unsigned int &length = 0);
    bool recoverFromPath(const std::string &corruptedDBPath,
                         const int pageSize,
                         const void *backupKey,
                         const unsigned int &backupKeyLength,
                         const void *databaseKey,
                         const unsigned int &databaseKeyLength);
    std::string getBackupPath() const;

    const Error &getError() const;

    void registerCommitedHook(const CommitedHook &onCommited, void *info);

    static const std::string backupSuffix;

protected:
    Handle(const Handle &) = delete;
    Handle &operator=(const Handle &) = delete;
    void *m_handle;
    Error m_error;
    Tag m_tag;

    void report();
    void addTrace(const std::string &sql, const int64_t &cost);
    bool shouldAggregation() const;

    typedef struct {
        CommitedHook onCommited;
        void *info;
        Handle *handle;
    } CommitedHookInfo;
    CommitedHookInfo m_commitedHookInfo;

    Trace m_trace;
    std::map<std::string, unsigned int> m_footprint;
    int64_t m_cost;
    bool m_aggregation;
};

} //namespace WCDB

#endif /* handle_hpp */
