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

#import <WCDB/WCTDatabase+Core.h>
#import <WCDB/WCTDatabase+Private.h>

@implementation WCTDatabase (Core)

+ (NSString *)DefaultConfigName
{
    return @(WCDB::Database::defaultConfigName.c_str());
}

- (void)setConfig:(WCDB::Config)invoke forName:(NSString *)name withOrder:(WCDB::Configs::Order)order
{
    _database->setConfig(name.UTF8String, invoke, order);
}

- (void)setConfig:(WCDB::Config)invoke forName:(NSString *)name
{
    _database->setConfig(name.UTF8String, invoke);
}

- (void)setSyncEnabled:(BOOL)sync
{
    _database->setSyncEnabled(sync);
}

@end
