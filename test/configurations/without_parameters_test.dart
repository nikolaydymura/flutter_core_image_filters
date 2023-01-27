import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CIColorInvert', () {
    final configuration = CIColorInvertConfiguration();
    expect(configuration.name, 'CIColorInvert');
  });
  test('CIColorThresholdOtsu', () {
    final configuration = CIColorThresholdOtsuConfiguration();
    expect(configuration.name, 'CIColorThresholdOtsu');
  });
  test('CIDepthToDisparity', () {
    final configuration = CIDepthToDisparityConfiguration();
    expect(configuration.name, 'CIDepthToDisparity');
  });
  test('CIDisparityToDepth', () {
    final configuration = CIDisparityToDepthConfiguration();
    expect(configuration.name, 'CIDisparityToDepth');
  });
  test('CILinearToSRGBToneCurve', () {
    final configuration = CILinearToSRGBToneCurveConfiguration();
    expect(configuration.name, 'CILinearToSRGBToneCurve');
  });
  test('CIMaskToAlpha', () {
    final configuration = CIMaskToAlphaConfiguration();
    expect(configuration.name, 'CIMaskToAlpha');
  });
  test('CIMaximumComponent', () {
    final configuration = CIMaximumComponentConfiguration();
    expect(configuration.name, 'CIMaximumComponent');
  });
  test('CIMedianFilter', () {
    final configuration = CIMedianFilterConfiguration();
    expect(configuration.name, 'CIMedianFilter');
  });
  test('CIMinimumComponent', () {
    final configuration = CIMinimumComponentConfiguration();
    expect(configuration.name, 'CIMinimumComponent');
  });
  test('CIPhotoEffectChrome', () {
    final configuration = CIPhotoEffectChromeConfiguration();
    expect(configuration.name, 'CIPhotoEffectChrome');
  });
  test('CIPhotoEffectFade', () {
    final configuration = CIPhotoEffectFadeConfiguration();
    expect(configuration.name, 'CIPhotoEffectFade');
  });
  test('CIPhotoEffectInstant', () {
    final configuration = CIPhotoEffectInstantConfiguration();
    expect(configuration.name, 'CIPhotoEffectInstant');
  });
  test('CIPhotoEffectMono', () {
    final configuration = CIPhotoEffectMonoConfiguration();
    expect(configuration.name, 'CIPhotoEffectMono');
  });
  test('CIPhotoEffectNoir', () {
    final configuration = CIPhotoEffectNoirConfiguration();
    expect(configuration.name, 'CIPhotoEffectNoir');
  });
  test('CIPhotoEffectProcess', () {
    final configuration = CIPhotoEffectProcessConfiguration();
    expect(configuration.name, 'CIPhotoEffectProcess');
  });
  test('CIPhotoEffectTonal', () {
    final configuration = CIPhotoEffectTonalConfiguration();
    expect(configuration.name, 'CIPhotoEffectTonal');
  });
  test('CIPhotoEffectTransfer', () {
    final configuration = CIPhotoEffectTransferConfiguration();
    expect(configuration.name, 'CIPhotoEffectTransfer');
  });
  test('CISRGBToneCurveToLinear', () {
    final configuration = CISRGBToneCurveToLinearConfiguration();
    expect(configuration.name, 'CISRGBToneCurveToLinear');
  });
  test('CIThermal', () {
    final configuration = CIThermalConfiguration();
    expect(configuration.name, 'CIThermal');
  });
  test('CIXRay', () {
    final configuration = CIXRayConfiguration();
    expect(configuration.name, 'CIXRay');
  });
}
