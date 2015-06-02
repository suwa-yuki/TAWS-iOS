#
# Be sure to run `pod lib lint TAWS.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TAWS"
  s.version          = "0.0.1"
  s.summary          = "Mock & Stub for AWSiOSSDKv2."
  s.description      = <<-DESC
TAWS is a Mocking & Stubbing Library for [AWSiOSSDKv2](https://github.com/aws/aws-sdk-ios).
`AWSMock` is simple class that can write stub & mock, it like RSpec.
Let try mocking and stubbing to AWS!
                       DESC
  s.homepage         = "https://github.com/classmethod/TAWS-iOS"
  s.license          = 'MIT'
  s.author           = { "suwa.yuki" => "suwa.yuki@classmethod.jp" }
  s.source           = { :git => "https://github.com/classmethod/TAWS-iOS.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/classmethod'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TAWS' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'AWSiOSSDKv2', '~> 2.1.1'
  s.dependency 'OCMock', '~> 3.1.2'
  s.dependency 'Bolts', '~> 1.1.5'
end
