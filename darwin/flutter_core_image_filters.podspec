#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_core_image_filters.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_core_image_filters'
  s.version          = '0.0.23'
  s.summary          = 'Core Image filters API'
  s.description      = <<-DESC
Core Image filters API.
                       DESC
  s.homepage         = 'https://github.com/nikolaydymura/flutter_core_image_filters'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Nikolay Dymura' => 'nikolay.dymura@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.ios.dependency 'Flutter'
  s.osx.dependency 'FlutterMacOS'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '14.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.ios.xcconfig = {
     'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)/ $(SDKROOT)/usr/lib/swift',
     'LD_RUNPATH_SEARCH_PATHS' => '/usr/lib/swift',
  }
  s.swift_version = '5.0'
  s.resource_bundles = {'flutter_core_image_filters_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
