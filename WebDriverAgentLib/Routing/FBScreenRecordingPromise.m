/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBScreenRecordingPromise.h"

@interface FBScreenRecordingPromise ()
@property (nonatomic) id promise;
@end

@implementation FBScreenRecordingPromise

- (instancetype)initWithNativePromise:(id)promise
{
  if ((self = [super init])) {
    self.promise = promise;
  }
  return self;
}

- (XCTAttachmentLifetime)lifetime
{
  SEL selector = NSSelectorFromString(@"lifetime");
  NSMethodSignature *methodSignature = [self.promise methodSignatureForSelector:selector];
  NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
  [invocation setSelector:selector];
  [invocation setTarget:self.promise];
  [invocation invoke];
  long result;
  [invocation getReturnValue:&result];
  return result;
}

- (void)setLifetime:(XCTAttachmentLifetime)lifetime
{
  SEL selector = NSSelectorFromString(@"setLifetime:");
  NSMethodSignature *methodSignature = [self.promise methodSignatureForSelector:selector];
  NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
  [invocation setSelector:selector];
  [invocation setTarget:self.promise];
  [invocation setArgument:&lifetime atIndex:2];
  [invocation invoke];
}

- (void)makeSystem
{
  SEL selector = NSSelectorFromString(@"makeSystem");
  NSMethodSignature *methodSignature = [self.promise methodSignatureForSelector:selector];
  NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
  [invocation setSelector:selector];
  [invocation setTarget:self.promise];
  [invocation invoke];
}

- (NSUUID *)identifier
{
  return (NSUUID *)[self.promise valueForKey:@"_UUID"];
}

- (NSData *)payload
{
  BOOL hasPayload = (BOOL)[self.promise valueForKey:@"_hasPayload"];
  return hasPayload ? (NSData *)[self.promise valueForKey:@"_payload"] : nil;
}

@end
