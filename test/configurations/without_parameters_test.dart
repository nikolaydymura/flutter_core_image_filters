import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  test('CIColorInvert', () {
    final configuration = CIColorInvertConfiguration();
    expect(configuration.name, 'CIColorInvert');
    expectEmptyInputKeys(configuration);
  });
  test('CIColorThresholdOtsu', () {
    final configuration = CIColorThresholdOtsuConfiguration();
    expect(configuration.name, 'CIColorThresholdOtsu');
    expectEmptyInputKeys(configuration);
  });
  test('CIDepthToDisparity', () {
    final configuration = CIDepthToDisparityConfiguration();
    expect(configuration.name, 'CIDepthToDisparity');
    expectEmptyInputKeys(configuration);
  });
  test('CIDisparityToDepth', () {
    final configuration = CIDisparityToDepthConfiguration();
    expect(configuration.name, 'CIDisparityToDepth');
    expectEmptyInputKeys(configuration);
  });
  test('CILinearToSRGBToneCurve', () {
    final configuration = CILinearToSRGBToneCurveConfiguration();
    expect(configuration.name, 'CILinearToSRGBToneCurve');
    expectEmptyInputKeys(configuration);
  });
  test('CIMaskToAlpha', () {
    final configuration = CIMaskToAlphaConfiguration();
    expect(configuration.name, 'CIMaskToAlpha');
    expectEmptyInputKeys(configuration);
  });
  test('CIMaximumComponent', () {
    final configuration = CIMaximumComponentConfiguration();
    expect(configuration.name, 'CIMaximumComponent');
    expectEmptyInputKeys(configuration);
  });
  test('CIMedianFilter', () {
    final configuration = CIMedianFilterConfiguration();
    expect(configuration.name, 'CIMedianFilter');
    expectEmptyInputKeys(configuration);
  });
  test('CIMinimumComponent', () {
    final configuration = CIMinimumComponentConfiguration();
    expect(configuration.name, 'CIMinimumComponent');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectChrome', () {
    final configuration = CIPhotoEffectChromeConfiguration();
    expect(configuration.name, 'CIPhotoEffectChrome');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectFade', () {
    final configuration = CIPhotoEffectFadeConfiguration();
    expect(configuration.name, 'CIPhotoEffectFade');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectInstant', () {
    final configuration = CIPhotoEffectInstantConfiguration();
    expect(configuration.name, 'CIPhotoEffectInstant');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectMono', () {
    final configuration = CIPhotoEffectMonoConfiguration();
    expect(configuration.name, 'CIPhotoEffectMono');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectNoir', () {
    final configuration = CIPhotoEffectNoirConfiguration();
    expect(configuration.name, 'CIPhotoEffectNoir');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectProcess', () {
    final configuration = CIPhotoEffectProcessConfiguration();
    expect(configuration.name, 'CIPhotoEffectProcess');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectTonal', () {
    final configuration = CIPhotoEffectTonalConfiguration();
    expect(configuration.name, 'CIPhotoEffectTonal');
    expectEmptyInputKeys(configuration);
  });
  test('CIPhotoEffectTransfer', () {
    final configuration = CIPhotoEffectTransferConfiguration();
    expect(configuration.name, 'CIPhotoEffectTransfer');
    expectEmptyInputKeys(configuration);
  });
  test('CISRGBToneCurveToLinear', () {
    final configuration = CISRGBToneCurveToLinearConfiguration();
    expect(configuration.name, 'CISRGBToneCurveToLinear');
    expectEmptyInputKeys(configuration);
  });
  test('CIThermal', () {
    final configuration = CIThermalConfiguration();
    expect(configuration.name, 'CIThermal');
    expectEmptyInputKeys(configuration);
  });
  test('CIXRay', () {
    final configuration = CIXRayConfiguration();
    expect(configuration.name, 'CIXRay');
    expectEmptyInputKeys(configuration);
  });
}
