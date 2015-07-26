//
//  AWSMobileAnalyticsEventMock.m
//  TAWS
//
//  Created by suwa.yuki on 6/9/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import "AWSMobileAnalyticsEventMock.h"

@interface AWSMobileAnalyticsEventMock ()

@property (assign, nonatomic) SEL stubMethod;
@property (strong, nonatomic) OCMStubRecorder *stubRecorder;

@end

@implementation AWSMobileAnalyticsEventMock

+ (instancetype)mock
{
    return [AWSMobileAnalyticsEventMock new];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mock = OCMProtocolMock(@protocol(AWSMobileAnalyticsEvent));
    }
    return self;
}

- (id)receive:(SEL)selector
{
    self.stubMethod = selector;
    return self;
}

- (void)createRecorder:(id)value
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    self.stubRecorder = OCMStub([self.mock performSelector:self.stubMethod withObject:value]);
#pragma clang diagnostic pop
}

- (void)createRecorder:(id)value1 withValue:(id)value2
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    self.stubRecorder = OCMStub([self.mock performSelector:self.stubMethod withObject:value1 withObject:value2]);
#pragma clang diagnostic pop
}

- (id)with:(id)value
{
    [self createRecorder:value];
    return self;
}

- (id)with:(id)value1 with:(id)value2
{
    [self createRecorder:value1 withValue:value2];
    return self;
}

- (id)andReturn:(id)value
{
    if (!self.stubRecorder) {
        [self createRecorder:OCMOCK_ANY];
    }
    id task = [AWSTask taskWithResult:value];
    self.stubRecorder.andReturn(task);
    return self;
}

- (void)verify
{
    OCMVerifyAll(self.mock);
}

@end
