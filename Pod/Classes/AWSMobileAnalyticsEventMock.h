//
//  AWSMobileAnalyticsEventMock.h
//  TAWS
//
//  Created by suwa.yuki on 6/9/15.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <AWSMobileAnalytics/AWSMobileAnalytics.h>
#import <OCMock/OCMock.h>

@interface AWSMobileAnalyticsEventMock : NSObject

@property (strong, nonatomic) id mock;

+ (instancetype)mock;

- (id)receive:(SEL)selector;

- (id)with:(id)value;

- (id)with:(id)value1 with:(id)value2;

- (id)andReturn:(id)value;

- (void)verify;

@end
