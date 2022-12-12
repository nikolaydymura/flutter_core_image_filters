import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CIPhotoEffectChrome', () {
    final configuration = CIPhotoEffectChromeConfiguration();
    expect(configuration.name, 'CIPhotoEffectChrome');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectFade', () {
    final configuration = CIPhotoEffectFadeConfiguration();
    expect(configuration.name, 'CIPhotoEffectFade');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectInstant', () {
    final configuration = CIPhotoEffectInstantConfiguration();
    expect(configuration.name, 'CIPhotoEffectInstant');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectMono', () {
    final configuration = CIPhotoEffectMonoConfiguration();
    expect(configuration.name, 'CIPhotoEffectMono');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectNoir', () {
    final configuration = CIPhotoEffectNoirConfiguration();
    expect(configuration.name, 'CIPhotoEffectNoir');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectProcess', () {
    final configuration = CIPhotoEffectProcessConfiguration();
    expect(configuration.name, 'CIPhotoEffectProcess');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectTonal', () {
    final configuration = CIPhotoEffectTonalConfiguration();
    expect(configuration.name, 'CIPhotoEffectTonal');
    expect(configuration.parameters.isEmpty, true);
  });
  test('CIPhotoEffectTransfer', () {
    final configuration = CIPhotoEffectTransferConfiguration();
    expect(configuration.name, 'CIPhotoEffectTransfer');
    expect(configuration.parameters.isEmpty, true);
  });
}
