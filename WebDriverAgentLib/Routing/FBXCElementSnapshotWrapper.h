/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBXCElementSnapshot.h"
#import "FBElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXCElementSnapshotWrapper : NSObject<FBXCElementSnapshot, FBElement>

@property (nonatomic, readonly) id<FBXCElementSnapshot> snapshot;

- (instancetype)initWithSnapshot:(id<FBXCElementSnapshot>)snapshot;
+ (instancetype)ensureWrapped:(nullable id<FBXCElementSnapshot>)snapshot;

@end

NS_ASSUME_NONNULL_END
