//
//  TAWSTests.m
//  TAWS
//
//  Created by suwa.yuki on 05/27/2015.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <TAWS/TAWS.h>
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

@implementation AWSSNSCreatePlatformEndpointInput (test)

- (BOOL)isEqual:(AWSSNSCreatePlatformEndpointInput*)object
{
    return [self.token isEqualToString:object.token];
}

@end

SpecBegin(InitialSpecs)

describe(@"AWSMock", ^{
    
    context(@"Mocking AutoScaling", ^{
        
        it(@"Call DescribeAutoScalingGroups and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSAutoScalingAutoScalingGroupNamesType *request = [AWSAutoScalingAutoScalingGroupNamesType new];
                AWSAutoScalingAutoScalingGroupsType *expectResponse = [AWSAutoScalingAutoScalingGroupsType new];
                expectResponse.autoScalingGroups = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceAutoScaling
                                          receive:@selector(describeAutoScalingGroups:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];
                [[autoScaling describeAutoScalingGroups:request] continueWithBlock:^id(BFTask *task) {
                    AWSAutoScalingAutoScalingGroupsType *response = task.result;
                    expect(response.autoScalingGroups).to.equal(@[@"expect_value"]);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking CloudWatch", ^{
        
        it(@"Call DescribeAlarms and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSCloudWatchDescribeAlarmsInput *request = [AWSCloudWatchDescribeAlarmsInput new];
                AWSCloudWatchDescribeAlarmsOutput *expectResponse = [AWSCloudWatchDescribeAlarmsOutput new];
                expectResponse.metricAlarms = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceCloudWatch
                                          receive:@selector(describeAlarms:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
                [[cloudWatch describeAlarms:request] continueWithBlock:^id(BFTask *task) {
                    AWSCloudWatchDescribeAlarmsOutput *response = task.result;
                    expect(response.metricAlarms).to.equal(@[@"expect_value"]);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking DynamoDB", ^{
        
        it(@"Call GetItem and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSDynamoDBGetItemInput *request = [AWSDynamoDBGetItemInput new];
                AWSDynamoDBGetItemOutput *expectResponse = [AWSDynamoDBGetItemOutput new];
                expectResponse.item = @{@"name":@"expect_value"};
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceDynamoDB
                                          receive:@selector(getItem:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
                [[dynamoDB getItem:request] continueWithBlock:^id(BFTask *task) {
                    AWSDynamoDBGetItemOutput *response = task.result;
                    expect(response.item).to.equal(@{@"name":@"expect_value"});
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking EC2", ^{
        
        it(@"Call DescribeInstances and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSEC2DescribeInstancesRequest *request = [AWSEC2DescribeInstancesRequest new];
                AWSEC2DescribeInstancesResult *expectResponse = [AWSEC2DescribeInstancesResult new];
                expectResponse.reservations = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceEC2
                                          receive:@selector(describeInstances:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSEC2 *ec2 = [AWSEC2 defaultEC2];
                [[ec2 describeInstances:request] continueWithBlock:^id(BFTask *task) {
                    AWSEC2DescribeInstancesResult *response = task.result;
                    expect(response.reservations).to.equal(@[@"expect_value"]);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking ElasticLoadBalancing", ^{
        
        it(@"Call DescribeInstanceHealth and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSElasticLoadBalancingDescribeEndPointStateInput *request = [AWSElasticLoadBalancingDescribeEndPointStateInput new];
                AWSElasticLoadBalancingDescribeEndPointStateOutput *expectResponse = [AWSElasticLoadBalancingDescribeEndPointStateOutput new];
                expectResponse.instanceStates = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceElasticLoadBalancing
                                          receive:@selector(describeInstanceHealth:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSElasticLoadBalancing *elb = [AWSElasticLoadBalancing defaultElasticLoadBalancing];
                [[elb describeInstanceHealth:request] continueWithBlock:^id(BFTask *task) {
                    AWSElasticLoadBalancingDescribeEndPointStateOutput *response = task.result;
                    expect(response.instanceStates).to.equal(@[@"expect_value"]);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking Kinesis", ^{
        
        it(@"Call PutRecord and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSKinesisPutRecordInput *request = [AWSKinesisPutRecordInput new];
                AWSKinesisPutRecordOutput *expectResponse = [AWSKinesisPutRecordOutput new];
                expectResponse.shardId = @"expect_value";
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceKinesis
                                          receive:@selector(putRecord:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
                [[kinesis putRecord:request] continueWithBlock:^id(BFTask *task) {
                    AWSKinesisPutRecordOutput *response = task.result;
                    expect(response.shardId).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking S3", ^{
        
        it(@"Call CreateBucket and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSS3CreateBucketRequest *request = [AWSS3CreateBucketRequest new];
                AWSS3CreateBucketOutput *expectResponse = [AWSS3CreateBucketOutput new];
                expectResponse.location = @"expect_value";
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceS3
                                          receive:@selector(createBucket:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSS3 *s3 = [AWSS3 defaultS3];
                [[s3 createBucket:request] continueWithBlock:^id(BFTask *task) {
                    AWSS3CreateBucketOutput *response = task.result;
                    expect(response.location).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking SES", ^{
        
        it(@"Call SendEmail and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSESSendEmailRequest *request = [AWSSESSendEmailRequest new];
                AWSSESSendEmailResponse *expectResponse = [AWSSESSendEmailResponse new];
                expectResponse.messageId = @"expect_value";
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceSES
                                          receive:@selector(sendEmail:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSES *ses = [AWSSES defaultSES];
                [[ses sendEmail:request] continueWithBlock:^id(BFTask *task) {
                    AWSSESSendEmailResponse *response = task.result;
                    expect(response.messageId).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking SNS", ^{
        
        it(@"Call CreatePlatformEndpoint and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSNSCreatePlatformEndpointInput *request = [AWSSNSCreatePlatformEndpointInput new];
                request.token = @"token";
                AWSSNSCreateEndpointResponse *expectResponse = [AWSSNSCreateEndpointResponse new];
                expectResponse.endpointArn = @"endpoint_xxxx";
                
                AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                                   receive:@selector(createPlatformEndpoint:)]
                                  with:request]
                                 andReturn:expectResponse];
                
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
    
    context(@"Mocking SQS", ^{
        
        it(@"Call SendMessage and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSQSSendMessageRequest *request = [AWSSQSSendMessageRequest new];
                AWSSQSSendMessageResult *expectResponse = [AWSSQSSendMessageResult new];
                expectResponse.messageId = @"expect_value";
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceSQS
                                          receive:@selector(sendMessage:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSQS *sqs = [AWSSQS defaultSQS];
                [[sqs sendMessage:request] continueWithBlock:^id(BFTask *task) {
                    AWSSQSSendMessageResult *response = task.result;
                    expect(response.messageId).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking SimpleDB", ^{
        
        it(@"Call GetAttributes and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSSimpleDBGetAttributesRequest *request = [AWSSimpleDBGetAttributesRequest new];
                AWSSimpleDBGetAttributesResult *expectResponse = [AWSSimpleDBGetAttributesResult new];
                expectResponse.attributes = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:AWSServiceSimpleDB
                                          receive:@selector(getAttributes:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSimpleDB *simpleDB = [AWSSimpleDB defaultSimpleDB];
                [[simpleDB getAttributes:request] continueWithBlock:^id(BFTask *task) {
                    AWSSimpleDBGetAttributesResult *response = task.result;
                    expect(response.attributes).to.equal(@[@"expect_value"]);
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