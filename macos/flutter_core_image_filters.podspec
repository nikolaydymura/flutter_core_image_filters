#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint core_image_filters.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_core_image_filters'
  s.version          = '0.0.1'
  s.summary          = 'Core Image filters API'
  s.description      = <<-DESC
Core Image filters API.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '14.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
