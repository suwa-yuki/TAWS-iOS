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
#import <AWSCore/AWSCognitoIdentity.h>
#import <AWSCognito/AWSCognitoSyncService.h>
#import <AWSDynamoDB/AWSDynamoDB.h>
#import <AWSEC2/AWSEC2.h>
#import <AWSElasticLoadBalancing/AWSElasticLoadBalancing.h>
#import <AWSKinesis/AWSKinesis.h>
#import <AWSLambda/AWSLambda.h>
#import <AWSMachineLearning/AWSMachineLearning.h>
#import <AWSS3/AWSS3.h>
#import <AWSSES/AWSSES.h>
#import <AWSSNS/AWSSNS.h>
#import <AWSSQS/AWSSQS.h>
#import <AWSSimpleDB/AWSSimpleDB.h>
#import <AWSAPIGateway/AWSAPIGateway.h>

@interface AWSMock ()

@property (strong, nonatomic) OCMockObject *mockObject;
@property (assign, nonatomic) SEL stubMethod;
@property (strong, nonatomic) OCMStubRecorder *stubRecorder;

@end

@implementation AWSMock

+ (instancetype)mockWith:(Class)serviceClass
{
    return [[AWSMock alloc] initWithClass:serviceClass];
}

+ (instancetype)mockWith:(Class)serviceClass
                 receive:(SEL)selector
                    with:(id)request
               andReturn:(id)response
{
    AWSMock *mock = [[AWSMock alloc] initWithClass:serviceClass];
    return [[[mock receive:selector] with:request] andReturn:response];
}

+ (instancetype)mockWith:(Class)serviceClass
                 receive:(SEL)selector with:(id)request
                   error:(NSError *)error
{
    AWSMock *mock = [[AWSMock alloc] initWithClass:serviceClass];
    return [[[mock receive:selector] with:request] andError:error];
}

+ (instancetype)mockWith:(Class)serviceClass
                 receive:(SEL)selector
                    with:(id)request
             errorDomain:(NSString *)domain
               errorType:(NSInteger)type
{
    AWSMock *mock = [[AWSMock alloc] initWithClass:serviceClass];
    return [[[mock receive:selector] with:request] andErrorDomain:domain type:type];
}

+ (instancetype)stubWith:(Class)serviceClass
{
    return [AWSMock mockWith:serviceClass];
}

+ (instancetype)stubWith:(Class)serviceClass
                 receive:(SEL)selector
                    with:(id)request
               andReturn:(id)response
{
    return [AWSMock mockWith:serviceClass
                     receive:selector
                        with:request
                   andReturn:response];
}

+ (instancetype)stubWith:(Class)serviceClass
                 receive:(SEL)selector
                    with:(id)request
                   error:(NSError *)error
{
    return [AWSMock mockWith:serviceClass
                     receive:selector
                        with:request
                       error:error];
}

+ (instancetype)stubWith:(Class)serviceClass
                 receive:(SEL)selector
                    with:(id)request
             errorDomain:(NSString *)domain
               errorType:(NSInteger)type
{
    return [AWSMock mockWith:serviceClass
                     receive:selector
                        with:request
                 errorDomain:domain
                   errorType:type];
}

- (instancetype)initWithClass:(Class)serviceClass
{
    self = [super init];
    if (self) {
        _serviceClass = serviceClass;
        [self createMock:serviceClass];
    }
    return self;
}

- (void)createMock:(Class)serviceClass
{
    id mock = OCMClassMock(serviceClass);
    if (serviceClass == [AWSAutoScaling class]) {
        OCMStub([mock defaultAutoScaling]).andReturn(mock);
    } else if (serviceClass == [AWSCloudWatch class]) {
        OCMStub([mock defaultCloudWatch]).andReturn(mock);
    } else if (serviceClass == [AWSCognitoIdentity class]) {
        OCMStub([mock defaultCognitoIdentity]).andReturn(mock);
    } else if (serviceClass == [AWSCognitoSync class]) {
        OCMStub([mock defaultCognitoSync]).andReturn(mock);
    } else if (serviceClass == [AWSDynamoDB class]) {
        OCMStub([mock defaultDynamoDB]).andReturn(mock);
    } else if (serviceClass == [AWSEC2 class]) {
        OCMStub([mock defaultEC2]).andReturn(mock);
    } else if (serviceClass == [AWSElasticLoadBalancing class]) {
        OCMStub([mock defaultElasticLoadBalancing]).andReturn(mock);
    } else if (serviceClass == [AWSKinesis class]) {
        OCMStub([mock defaultKinesis]).andReturn(mock);
    } else if (serviceClass == [AWSLambda class]) {
        OCMStub([mock defaultLambda]).andReturn(mock);
    } else if (serviceClass == [AWSMachineLearning class]) {
        OCMStub([mock defaultMachineLearning]).andReturn(mock);
    } else if (serviceClass == [AWSS3 class]) {
        OCMStub([mock defaultS3]).andReturn(mock);
    } else if (serviceClass == [AWSSES class]) {
        OCMStub([mock defaultSES]).andReturn(mock);
    } else if (serviceClass == [AWSSNS class]) {
        OCMStub([mock defaultSNS]).andReturn(mock);
    } else if (serviceClass == [AWSSQS class]) {
        OCMStub([mock defaultSQS]).andReturn(mock);
    } else if (serviceClass == [AWSSimpleDB class]) {
        OCMStub([mock defaultSimpleDB]).andReturn(mock);
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
