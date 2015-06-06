//
//  TAWS.m
//  TAWS
//
//  Created by suwa.yuki on 2015/05/26.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import "TAWS.h"
#import <AWSAutoScaling/AWSAutoScaling.h>
#import <AWSCloudWatch/AWSCloudWatch.h>
#import <AWSDynamoDB/AWSDynamoDB.h>
#import <AWSEC2/AWSEC2.h>
#import <AWSElasticLoadBalancing/AWSElasticLoadBalancing.h>
#import <AWSKinesis/AWSKinesis.h>
#import <AWSS3/AWSS3.h>
#import <AWSSES/AWSSES.h>
#import <AWSSNS/AWSSNS.h>
#import <AWSSQS/AWSSQS.h>
#import <AWSSimpleDB/AWSSimpleDB.h>

@interface AWSMock ()

@property (strong, nonatomic) OCMockObject *mockObject;
@property (assign, nonatomic) SEL stubMethod;
@property (strong, nonatomic) OCMStubRecorder *stubRecorder;

@end

@implementation AWSMock

+ (instancetype)mockWith:(AWSServiceType)serviceType
{
    return [[AWSMock alloc] initWithServiceType:serviceType];
}

+ (instancetype)mockWith:(AWSServiceType)serviceType
                 receive:(SEL)selector
                    with:(id)request
               andReturn:(id)response
{
    AWSMock *mock = [[AWSMock alloc] initWithServiceType:serviceType];
    return [[[mock receive:selector] with:request] andReturn:response];
}

+ (instancetype)mockWith:(AWSServiceType)serviceType
                 receive:(SEL)selector with:(id)request
                   error:(NSError *)error
{
    AWSMock *mock = [[AWSMock alloc] initWithServiceType:serviceType];
    return [[[mock receive:selector] with:request] andError:error];
}

+ (instancetype)mockWith:(AWSServiceType)serviceType
                 receive:(SEL)selector
                    with:(id)request
             errorDomain:(NSString *)domain
               errorType:(NSInteger)type
{
    AWSMock *mock = [[AWSMock alloc] initWithServiceType:serviceType];
    return [[[mock receive:selector] with:request] andErrorDomain:domain type:type];
}

+ (instancetype)stubWith:(AWSServiceType)serviceType
{
    return [AWSMock mockWith:serviceType];
}

+ (instancetype)stubWith:(AWSServiceType)serviceType
                 receive:(SEL)selector
                    with:(id)request
               andReturn:(id)response
{
    return [AWSMock mockWith:serviceType
                     receive:selector
                        with:request
                   andReturn:response];
}

+ (instancetype)stubWith:(AWSServiceType)serviceType
                 receive:(SEL)selector
                    with:(id)request
                   error:(NSError *)error
{
    return [AWSMock mockWith:serviceType
                     receive:selector
                        with:request
                       error:error];
}

+ (instancetype)stubWith:(AWSServiceType)serviceType
                 receive:(SEL)selector
                    with:(id)request
             errorDomain:(NSString *)domain
               errorType:(NSInteger)type
{
    return [AWSMock mockWith:serviceType
                     receive:selector
                        with:request
                 errorDomain:domain
                   errorType:type];
}

- (instancetype)initWithServiceType:(AWSServiceType)serviceType
{
    self = [super init];
    if (self) {
        _serviceType = serviceType;
        [self createMock:_serviceType];
    }
    return self;
}

- (void)createMock:(AWSServiceType)serviceType
{
    id mock = nil;
    switch (serviceType) {
        case AWSServiceAutoScaling:
            mock = OCMClassMock([AWSAutoScaling class]);
            OCMStub([mock defaultAutoScaling]).andReturn(mock);
            break;
        case AWSServiceCloudWatch:
            mock = OCMClassMock([AWSCloudWatch class]);
            OCMStub([mock defaultCloudWatch]).andReturn(mock);
            break;
        case AWSServiceDynamoDB:
            mock = OCMClassMock([AWSDynamoDB class]);
            OCMStub([mock defaultDynamoDB]).andReturn(mock);
            break;
        case AWSServiceEC2:
            mock = OCMClassMock([AWSEC2 class]);
            OCMStub([mock defaultEC2]).andReturn(mock);
            break;
        case AWSServiceElasticLoadBalancing:
            mock = OCMClassMock([AWSElasticLoadBalancing class]);
            OCMStub([mock defaultElasticLoadBalancing]).andReturn(mock);
            break;
        case AWSServiceKinesis:
            mock = OCMClassMock([AWSKinesis class]);
            OCMStub([mock defaultKinesis]).andReturn(mock);
            break;
        case AWSServiceS3:
            mock = OCMClassMock([AWSS3 class]);
            OCMStub([mock defaultS3]).andReturn(mock);
            break;
        case AWSServiceSES:
            mock = OCMClassMock([AWSSES class]);
            OCMStub([mock defaultSES]).andReturn(mock);
            break;
        case AWSServiceSNS:
            mock = OCMClassMock([AWSSNS class]);
            OCMStub([mock defaultSNS]).andReturn(mock);
            break;
        case AWSServiceSQS:
            mock = OCMClassMock([AWSSQS class]);
            OCMStub([mock defaultSQS]).andReturn(mock);
            break;
        case AWSServiceSimpleDB:
            mock = OCMClassMock([AWSSimpleDB class]);
            OCMStub([mock defaultSimpleDB]).andReturn(mock);
            break;
        default:
            break;
    }
    self.mockObject = mock;
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
    self.stubRecorder = OCMStub([self.mockObject performSelector:self.stubMethod withObject:value]);
#pragma clang diagnostic pop
}

- (id)with:(id)value
{
    [self createRecorder:value];
    return self;
}

- (id)andReturn:(id)value
{
    if (!self.stubRecorder) {
        [self createRecorder:OCMOCK_ANY];
    }
    id task = [BFTask taskWithResult:value];
    self.stubRecorder.andReturn(task);
    return self;
}

- (id)andError:(NSError *)error
{
    if (!self.stubRecorder) {
        [self createRecorder:OCMOCK_ANY];
    }
    id task = [BFTask taskWithError:error];
    self.stubRecorder.andReturn(task);
    return self;
}

- (id)andErrorDomain:(NSString *)domain type:(NSInteger)type
{
    if (!self.stubRecorder) {
        [self createRecorder:OCMOCK_ANY];
    }
    id task = [BFTask taskWithError:[NSError errorWithDomain:domain code:type userInfo:nil]];
    self.stubRecorder.andReturn(task);
    return self;
}

- (void)verify
{
    OCMVerifyAll(self.mockObject);
}

@end
