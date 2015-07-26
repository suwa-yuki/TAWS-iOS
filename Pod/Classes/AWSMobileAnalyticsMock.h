//
//  AWSMobileAnalyticsMock.h
//  TAWS
//
//  Created by suwa.yuki on 6/7/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <AWSMobileAnalytics/AWSMobileAnalytics.h>
#import <OCMock/OCMock.h>
#import "AWSMobileAnalyticsEventClientMock.h"

@interface AWSMobileAnalyticsMock : NSObject

@property (strong, nonatomic) id mock;

@property (strong, nonatomic) AWSMobileAnalyticsEventClientMock *eventClientMock;

+ (instancetype)mockWithAppId:(NSString *)appId;

- (void)verify;

@end