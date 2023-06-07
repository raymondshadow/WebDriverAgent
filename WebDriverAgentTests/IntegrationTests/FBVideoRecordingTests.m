/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

#import "FBIntegrationTestCase.h"

#import "FBConfiguration.h"
#import "FBMacros.h"
#import "FBScreenRecordingPromise.h"
#import "FBScreenRecordingRequest.h"
#import "FBXCTestDaemonsProxy.h"

@interface FBVideoRecordingTest : FBIntegrationTestCase
@end

@implementation FBVideoRecordingTest

- (void)setUp
{
  [FBConfiguration disableDiagnosticScreenRecordings];
  [super setUp];
}

- (void)testStartingAndStoppingVideoRecording
{
  // Video recording is only available since iOS 17
  if (SYSTEM_VERSION_LESS_THAN(@"17.0")) {
    return;
  }

  FBScreenRecordingRequest *recordingRequest = [[FBScreenRecordingRequest alloc] initWithFps:24
                                                                                       codec:0];
  NSError *error;
  FBScreenRecordingPromise *promise = [FBXCTestDaemonsProxy startScreenRecordingWithRequest:recordingRequest
                                                                                      error:&error];
  [promise makeSystem];
  XCTAssertNotNil(promise);
  XCTAssertNil(promise.payload);
  XCTAssertNil(error);

  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.]];

  BOOL isSuccessfull = [FBXCTestDaemonsProxy stopScreenRecordingWithUUID:promise.identifier error:&error];
  XCTAssertTrue(isSuccessfull);
  XCTAssertNil(error);
  XCTAssertNotNil(promise.payload);
}

@end
