//
//  TAWSTests.m
//  TAWSTests
//
//  Created by suwa.yuki on 05/27/2015.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <AWSSNS/AWSSNS.h>
#import <TAWS/AWSMock.h>

@implementation AWSSNSCreatePlatformEndpointInput (test)

- (BOOL)isEqual:(AWSSNSCreatePlatformEndpointInput*)object
{
    return [self.token isEqualToString:object.token];
}

@end

SpecBegin(InitialSpecs)

describe(@"AWSMock", ^{
    
    context(@"mocking AWS SNS", ^{
        
        it(@"call CreatePlatformEndpoint and Succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
                request.token = @"token";
                AWSSNSCreateEndpointResponse *response = [AWSSNSCreateEndpointResponse new];
                response.endpointArn = @"endpointxxxx";
                
                AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                                   receive:@selector(createPlatformEndpoint:)]
                                      with:request]
                                 andReturn:response];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(BFTask *task) {
                    AWSSNSCreateEndpointResponse * response = task.result;
                    expect(response.endpointArn).equal(@"endpointxxxx");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
        it(@"call CreatePlatformEndpoint and Failed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
                request.token = @"token";
                AWSSNSCreateEndpointResponse *response = [AWSSNSCreateEndpointResponse new];
                response.endpointArn = @"endpointxxxx";
                
                AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                                   receive:@selector(createPlatformEndpoint:)]
                                      with:request]
                            andErrorDomain:AWSSNSErrorDomain
                                      type:AWSSNSErrorSubscriptionLimitExceeded];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(BFTask *task) {
                    expect(task.error).toNot.beNil();
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
});

SpecEnd