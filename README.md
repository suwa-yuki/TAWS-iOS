# TAWS

[![CI Status](http://img.shields.io/travis/suwa.yuki/TAWS.svg?style=flat)](https://travis-ci.org/suwa.yuki/TAWS)
[![Version](https://img.shields.io/cocoapods/v/TAWS.svg?style=flat)](http://cocoapods.org/pods/TAWS)
[![License](https://img.shields.io/cocoapods/l/TAWS.svg?style=flat)](http://cocoapods.org/pods/TAWS)
[![Platform](https://img.shields.io/cocoapods/p/TAWS.svg?style=flat)](http://cocoapods.org/pods/TAWS)

TAWS is a Mocking & Stubbing Library for [AWSiOSSDKv2](https://github.com/aws/aws-sdk-ios).  
`AWSMock` is simple class that can write stub & mock, it like RSpec.  
Let try mocking and stubbing to AWS!

## Usage

1. To run the example project, clone the repo, and run `pod install` from the Example directory first.
2. `#import <TAWS/AWSMock.h>` in your test case.

### AWSMock
```objective-c
AWSMock *mock = [[[[AWSMock mockWith:AWSServiceSNS]
                   receive:@selector(createPlatformEndpoint:)]
                      with:request]
                 andReturn:response];
```

## Requirements

TAWS require [AWSiOSSDKv2](https://github.com/aws/aws-sdk-ios).

## Installation

TAWS is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TAWS"
```

## Author

[Classmethod, Inc.](http://classmethod.jp/)

## License

TAWS is available under the MIT license. See the LICENSE file for more info.
