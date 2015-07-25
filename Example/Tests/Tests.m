//
//  TAWSTests.m
//  TAWS
//
//  Created by suwa.yuki on 05/27/2015.
//  Copyright (c) 2015 classmethod, Inc. All rights reserved.
//

#import <TAWS/TAWS.h>
#import <AWSCore/AWSCore.h>
#import <AWSCore/AWSCognitoIdentity.h>
#import <AWSCognito/AWSCognitoService.h>
#import <AWSAutoScaling/AWSAutoScaling.h>
#import <AWSCloudWatch/AWSCloudWatch.h>
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

SpecBegin(InitialSpecs)

describe(@"AWSMock", ^{
    
    context(@"Mocking AutoScaling", ^{
        
        it(@"Call DescribeAutoScalingGroups and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSAutoScalingAutoScalingGroupNamesType *request = [AWSAutoScalingAutoScalingGroupNamesType new];
                AWSAutoScalingAutoScalingGroupsType *expectResponse = [AWSAutoScalingAutoScalingGroupsType new];
                expectResponse.autoScalingGroups = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:[AWSAutoScaling class]
                                          receive:@selector(describeAutoScalingGroups:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];
                [[autoScaling describeAutoScalingGroups:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSCloudWatch class]
                                          receive:@selector(describeAlarms:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
                [[cloudWatch describeAlarms:request] continueWithBlock:^id(AWSTask *task) {
                    AWSCloudWatchDescribeAlarmsOutput *response = task.result;
                    expect(response.metricAlarms).to.equal(@[@"expect_value"]);
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking CognitoIdentity", ^{
        
        it(@"Call CreateIdentityPool and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSCognitoIdentityCreateIdentityPoolInput *request = [AWSCognitoIdentityCreateIdentityPoolInput new];
                AWSCognitoIdentityIdentityPool *expectResponse = [AWSCognitoIdentityIdentityPool new];
                expectResponse.identityPoolId = @"expect_value";
                
                AWSMock *mock = [AWSMock mockWith:[AWSCognitoIdentity class]
                                          receive:@selector(createIdentityPool:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSCognitoIdentity *cognitoIdentity = [AWSCognitoIdentity defaultCognitoIdentity];
                [[cognitoIdentity createIdentityPool:request] continueWithBlock:^id(AWSTask *task) {
                    AWSCognitoIdentityIdentityPool *response = task.result;
                    expect(response.identityPoolId).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking CognitoSync", ^{
        
        it(@"Call UpdateRecords and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSCognitoSyncUpdateRecordsRequest *request = [AWSCognitoSyncUpdateRecordsRequest new];
                AWSCognitoSyncUpdateRecordsResponse *expectResponse = [AWSCognitoSyncUpdateRecordsResponse new];
                expectResponse.records = @[@"expect_value"];
                
                AWSMock *mock = [AWSMock mockWith:[AWSCognitoSync class]
                                          receive:@selector(updateRecords:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSCognitoSync *cognitoSync = [AWSCognitoSync defaultCognitoSync];
                [[cognitoSync updateRecords:request] continueWithBlock:^id(AWSTask *task) {
                    AWSCognitoSyncUpdateRecordsResponse *response = task.result;
                    expect(response.records).to.equal(@[@"expect_value"]);
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSDynamoDB class]
                                          receive:@selector(getItem:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
                [[dynamoDB getItem:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSEC2 class]
                                          receive:@selector(describeInstances:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSEC2 *ec2 = [AWSEC2 defaultEC2];
                [[ec2 describeInstances:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSElasticLoadBalancing class]
                                          receive:@selector(describeInstanceHealth:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSElasticLoadBalancing *elb = [AWSElasticLoadBalancing defaultElasticLoadBalancing];
                [[elb describeInstanceHealth:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSKinesis class]
                                          receive:@selector(putRecord:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
                [[kinesis putRecord:request] continueWithBlock:^id(AWSTask *task) {
                    AWSKinesisPutRecordOutput *response = task.result;
                    expect(response.shardId).to.equal(@"expect_value");
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking Lambda", ^{
        
        it(@"Call Invoke and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSLambdaInvocationRequest *request = [AWSLambdaInvocationRequest new];
                AWSLambdaInvocationResponse *expectResponse = [AWSLambdaInvocationResponse new];
                expectResponse.payload = @{@"key":@"expect_value"};
                
                AWSMock *mock = [AWSMock mockWith:[AWSLambda class]
                                          receive:@selector(invoke:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSLambda *lambda = [AWSLambda defaultLambda];
                [[lambda invoke:request] continueWithBlock:^id(AWSTask *task) {
                    AWSLambdaInvocationResponse *response = task.result;
                    expect(response.payload).to.equal(@{@"key":@"expect_value"});
                    [mock verify];
                    done();
                    return nil;
                }];
                
            });
            
        });
        
    });
    
    context(@"Mocking MachineLearning", ^{
        
        it(@"Call Predict and succeed", ^{
            
            waitUntil(^(DoneCallback done) {
                
                AWSMachineLearningPredictInput *request = [AWSMachineLearningPredictInput new];
                AWSMachineLearningPredictOutput *expectResponse = [AWSMachineLearningPredictOutput new];
                expectResponse.prediction = [AWSMachineLearningPrediction new];
                expectResponse.prediction.predictedValue = @10;
                
                AWSMock *mock = [AWSMock mockWith:[AWSMachineLearning class]
                                          receive:@selector(predict:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSMachineLearning *ml = [AWSMachineLearning defaultMachineLearning];
                [[ml predict:request] continueWithBlock:^id(AWSTask *task) {
                    AWSMachineLearningPredictOutput *response = task.result;
                    expect(response.prediction.predictedValue).to.equal(@10);
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSS3 class]
                                          receive:@selector(createBucket:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSS3 *s3 = [AWSS3 defaultS3];
                [[s3 createBucket:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSSES class]
                                          receive:@selector(sendEmail:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSES *ses = [AWSSES defaultSES];
                [[ses sendEmail:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSSNS class]
                                          receive:@selector(createPlatformEndpoint:)
                                             with:request
                                        andReturn:expectResponse];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSSNS class]
                                          receive:@selector(createPlatformEndpoint:)
                                             with:request
                                      errorDomain:AWSSNSErrorDomain
                                        errorType:AWSSNSErrorInvalidParameter];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns createPlatformEndpoint:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSSQS class]
                                          receive:@selector(sendMessage:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSQS *sqs = [AWSSQS defaultSQS];
                [[sqs sendMessage:request] continueWithBlock:^id(AWSTask *task) {
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
                
                AWSMock *mock = [AWSMock mockWith:[AWSSimpleDB class]
                                          receive:@selector(getAttributes:)
                                             with:OCMOCK_ANY
                                        andReturn:expectResponse];
                
                AWSSimpleDB *simpleDB = [AWSSimpleDB defaultSimpleDB];
                [[simpleDB getAttributes:request] continueWithBlock:^id(AWSTask *task) {
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
                
                [AWSStub stubWith:[AWSSNS class]
                          receive:@selector(subscribe:)
                             with:request
                        andReturn:response];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(AWSTask *task) {
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
                
                [AWSStub stubWith:[AWSSNS class]
                          receive:@selector(subscribe:)
                             with:request
                            error:error];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(AWSTask *task) {
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
                
                [AWSStub stubWith:[AWSSNS class]
                          receive:@selector(subscribe:)
                             with:request
                      errorDomain:AWSSNSErrorDomain
                        errorType:AWSSNSErrorSubscriptionLimitExceeded];
                
                AWSSNS *sns = [AWSSNS defaultSNS];
                [[sns subscribe:request] continueWithBlock:^id(AWSTask *task) {
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