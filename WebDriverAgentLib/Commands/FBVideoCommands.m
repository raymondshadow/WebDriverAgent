/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBVideoCommands.h"

#import "FBRouteRequest.h"
#import "FBScreenRecordingPromise.h"
#import "FBScreenRecordingRequest.h"
#import "FBSession.h"
#import "FBXCTestDaemonsProxy.h"

const NSUInteger DEFAULT_FPS = 24;
const NSUInteger DEFAULT_CODEC = 0;

@implementation FBVideoCommands

+ (NSArray *)routes
{
  return
  @[
    [[FBRoute POST:@"/wda/video/start_recording"] respondWithTarget:self action:@selector(handleStartVideoRecording:)],
    [[FBRoute POST:@"/wda/video/stop_recording"] respondWithTarget:self action:@selector(handleStopVideoRecording:)],
  ];
}

+ (id<FBResponsePayload>)handleStartVideoRecording:(FBRouteRequest *)request
{
  FBScreenRecordingPromise *promise = request.session.activeScreenRecording;
  NSError *error;
  if (nil != promise) {
    if (![FBXCTestDaemonsProxy stopScreenRecordingWithUUID:promise.identifier error:&error]) {
      return FBResponseWithUnknownError(error);
    }
    request.session.activeScreenRecording = nil;
  }

  NSNumber *fps = (NSNumber *)request.arguments[@"fps"];
  NSNumber *codec = (NSNumber *)request.arguments[@"codec"];
  FBScreenRecordingRequest *recordingRequest = [[FBScreenRecordingRequest alloc] initWithFps:nil == fps ? DEFAULT_FPS : fps.integerValue
                                                                                       codec:nil == codec ? DEFAULT_CODEC : codec.longLongValue];
  promise = [FBXCTestDaemonsProxy startScreenRecordingWithRequest:recordingRequest
                                                            error:&error];
  if (nil == promise) {
    return FBResponseWithUnknownError(error);
  }
  request.session.activeScreenRecording = promise;
  return FBResponseWithOK();
}

+ (id<FBResponsePayload>)handleStopVideoRecording:(FBRouteRequest *)request
{
  FBScreenRecordingPromise *promise = request.session.activeScreenRecording;
  if (nil == promise) {
    return FBResponseWithOK();
  }
  NSError *error;
  if (nil != promise) {
    if (![FBXCTestDaemonsProxy stopScreenRecordingWithUUID:promise.identifier error:&error]) {
      return FBResponseWithUnknownError(error);
    }
    request.session.activeScreenRecording = nil;
  }

  // TODO: Respond with base64-encoded payload
  return FBResponseWithOK();
}


@end
