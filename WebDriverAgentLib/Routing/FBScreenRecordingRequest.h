/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBScreenRecordingRequest : NSObject

@property (readonly, nonatomic) NSUInteger fps;
@property (readonly, nonatomic) long long codec;

- (instancetype)initWithFps:(NSUInteger)fps codec:(long long)codec;
- (nullable id)toNativeRequestWithError:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
