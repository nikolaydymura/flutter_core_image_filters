import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILightTunnelConfiguration configuration;
  setUp(() {
    configuration = CILightTunnelConfiguration();
  });
  group('CILightTunnel', skip: true, () {
    test('verify name', () {
      expect(configuration.name, 'CILightTunnel');
    });
    testInputKeys(build: () => configuration);
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 110);
      configuration.radius = 300;
      expect(parameter.value, 300);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputRotation', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRotation') as NumberParameter;
      expect(parameter.value, 0);
      configuration.rotation = 1;
      expect(parameter.value, 1);
    });
  });
}
