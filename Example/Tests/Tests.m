//
//  TAWSTests.m
//  TAWS
//
//  Created by suwa.yuki on 05/27/2015.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <AWSSNS/AWSSNS.h>
#import <TAWS/TAWS.h>

@implementation AWSSNSCreatePlatformEndpointInput (test)

- (BOOL)isEqual:(AWSSNSCreatePlatformEndpointInput*)object
{
    return [self.token isEqualToString:object.token];
}

@end

SpecBegin(InitialSpecs)

describe(@"AWSMock", ^{
    
    context(@"Mocking SNS", ^{
        
        it(@"Call CreatePlatformEndpoint and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
                request.token = @"token";
                AWSSNSCreateEndpointResponse *response = [AWSSNSCreateEndpointResponse new];
                response.endpointArn = @"endpoint_xxxx";
                
                AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                                   receive:@selector(createPlatformEndpoint:)]
                                      with:request]
                                 andReturn:response];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(BFTask *task) {
                    AWSSNSCreateEndpointResponse * response = task.result;
                    expect(response.endpointArn).equal(@"endpoint_xxxx");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
        it(@"Call CreatePlatformEndpoint and failed by error domain", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
                request.token = @"token";
                AWSSNSCreateEndpointResponse *response = [AWSSNSCreateEndpointResponse new];
                response.endpointArn = @"endpoint_xxxx";
                
                AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                                   receive:@selector(createPlatformEndpoint:)]
                                      with:request]
                            andErrorDomain:AWSSNSErrorDomain
                                      type:AWSSNSErrorInvalidParameter];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(BFTask *task) {
                    expect(task.error).toNot.beNil();
                    expect(task.error.domain).to.equal(AWSSNSErrorDomain);
                    expect(task.error.code).to.equal(AWSSNSErrorInvalidParameter);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
});

describe(@"AWSStub", ^{
    
    context(@"Initialize", ^{
        
        it(@"Call conveniense constractor for succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSSubscribeInput *request = [AWSSNSSubscribeInput new];
                request.endpoint = @"endpoint_xxxx";
                
                AWSSNSSubscribeResponse *response = [AWSSNSSubscribeResponse new];
                response.subscriptionArn = @"expected_arn";
                
                [AWSStub stubWith:AWSServiceSNS
                          receive:@selector(subscribe:)
                             with:request
                        andReturn:response];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(BFTask *task) {
                    AWSSNSSubscribeResponse *response = task.result;
                    expect(response.subscriptionArn).equal(@"expected_arn");
                    done();
                    return nil;
                }];
                
            });
            
        });
        
        it(@"Call conveniense constractor and failed by NSError object", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSSubscribeInput *request = [AWSSNSSubscribeInput new];
                request.endpoint = @"endpoint_xxxx";
                
                NSError *error = [NSError errorWithDomain:AWSSNSErrorDomain
                                                     code:AWSSNSErrorSubscriptionLimitExceeded
                                                 userInfo:nil];
                
                [AWSStub stubWith:AWSServiceSNS
                          receive:@selector(subscribe:)
                             with:request
                            error:error];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(BFTask *task) {
                    expect(task.error).toNot.beNil();
                    expect(task.error.domain).to.equal(AWSSNSErrorDomain);
                    expect(task.error.code).to.equal(AWSSNSErrorSubscriptionLimitExceeded);
                    done();
                    return nil;
                }];
                
            });
            
        });
        
        it(@"Call conveniense constractor and failed by error domain", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSSubscribeInput *request = [AWSSNSSubscribeInput new];
                request.endpoint = @"endpoint_xxxx";
                
                [AWSStub stubWith:AWSServiceSNS
                          receive:@selector(subscribe:)
                             with:request
                      errorDomain:AWSSNSErrorDomain
                        errorType:AWSSNSErrorSubscriptionLimitExceeded];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(BFTask *task) {
                    expect(task.error).toNot.beNil();
                    expect(task.error.domain).to.equal(AWSSNSErrorDomain);
                    expect(task.error.code).to.equal(AWSSNSErrorSubscriptionLimitExceeded);
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
});

SpecEnd