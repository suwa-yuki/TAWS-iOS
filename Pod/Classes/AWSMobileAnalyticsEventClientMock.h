//
//  AWSMobileAnalyticsEventClientMock.h
//  TAWS
//
//  Created by suwa.yuki on 6/8/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <AWSMobileAnalytics/AWSMobileAnalytics.h>
#import <OCMock/OCMock.h>
#import "AWSMobileAnalyticsEventMock.h"

@interface AWSMobileAnalyticsEventClientMock : NSObject

@property (strong, nonatomic) id mock;

+ (instancetype)mock;

- (AWSMobileAnalyticsEventMock *)eventMockWithType:(NSString *)type;

- (id)shouldReceiveEvent:(NSString *)type attribute:(id)attribute key:(NSString *)key;

- (id)shouldReceiveEvent:(NSString *)type metric:(id)metric key:(NSString *)key;

- (id)shouldReceive:(SEL)selector;

- (void)verify;

@end