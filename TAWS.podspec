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
  s.version          = "0.1.0"
  s.summary          = "A short description of TAWS."
  s.description      = <<-DESC
                       An optional longer description of TAWS

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/classmethod/TAWS"
  s.license          = 'MIT'
  s.author           = { "suwa.yuki" => "suwa.yuki@classmethod.jp" }
  s.source           = { :git => "https://github.com/classmethod/TAWS.git", :tag => s.version.to_s }
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
