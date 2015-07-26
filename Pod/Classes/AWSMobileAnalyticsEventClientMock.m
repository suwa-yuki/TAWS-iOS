//
//  AWSMobileAnalyticsEventClientMock.m
//  TAWS
//
//  Created by suwa.yuki on 6/8/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import "AWSMobileAnalyticsEventClientMock.h"

@implementation AWSMobileAnalyticsEventClientMock

+ (instancetype)mock
{
    return [AWSMobileAnalyticsEventClientMock new];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mock = OCMProtocolMock(@protocol(AWSMobileAnalyticsEventClient));
    }
    return self;
}

- (id)shouldReceiveEvent:(NSString *)type attribute:(id)attribute key:(NSString *)key
{
    AWSMobileAnalyticsEventMock *eventMock = [AWSMobileAnalyticsEventMock mock];
    [[eventMock receive:@selector(addAttribute:forKey:)] with:attribute with:key];
    OCMExpect([self.mock createEventWithEventType:type]).andReturn(eventMock.mock);
    OCMExpect([self.mock recordEvent:eventMock.mock]);
    return self;
}

- (id)shouldReceiveEvent:(NSString *)type metric:(id)metric key:(NSString *)key
{
    AWSMobileAnalyticsEventMock *eventMock = [AWSMobileAnalyticsEventMock mock];
    [[eventMock receive:@selector(addMetric:forKey:)] with:metric with:key];
    OCMExpect([self.mock createEventWithEventType:type]).andReturn(eventMock.mock);
    OCMExpect([self.mock recordEvent:eventMock.mock]);
    return self;
}

- (id)shouldReceive:(SEL)selector
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    OCMStub([self.mock performSelector:selector]);
#pragma clang diagnostic pop
}

- (void)verify
{
    OCMVerifyAll(self.mock);
}

@end