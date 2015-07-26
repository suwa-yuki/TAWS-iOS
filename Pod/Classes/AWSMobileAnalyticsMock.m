//
//  AWSMobileAnalyticsMock.m
//  TAWS
//
//  Created by suwa.yuki on 6/7/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import "AWSMobileAnalyticsMock.h"

@implementation AWSMobileAnalyticsMock

+ (instancetype)mockWithAppId:(NSString *)appId
{
    return [[AWSMobileAnalyticsMock alloc] initWithAppId:appId];
}

- (instancetype)initWithAppId:(NSString *)appId
{
    self = [super init];
    if (self) {
        self.mock = OCMClassMock([AWSMobileAnalytics class]);
        
        self.eventClientMock = [AWSMobileAnalyticsEventClientMock mock];
        OCMStub([self.mock eventClient]).andReturn(self.eventClientMock.mock);
        
        __weak typeof(self) weakSelf = self;
        void (^comp)(NSInvocation *) = ^(NSInvocation *invocation) {
            typeof(weakSelf) self = weakSelf;
            void(^block)(AWSMobileAnalytics *);
            [invocation getArgument:&block atIndex:4];
            block(self.mock);
        };
        
        OCMStub([self.mock mobileAnalyticsForAppId:appId
                                     configuration:OCMOCK_ANY
                                   completionBlock:OCMOCK_ANY])
        .andDo(comp).andReturn(self.mock);
        
    }
    return self;
}

- (void)verify
{
    OCMVerifyAll(self.mock);
}

@end
