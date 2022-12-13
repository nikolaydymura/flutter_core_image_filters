import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAccordionFoldTransitionConfiguration configuration;
  setUp(() {
    configuration = CIAccordionFoldTransitionConfiguration();
  });
  group('CIAccordionFoldTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CIAccordionFoldTransition');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, [
        'inputTime',
        'inputNumberOfFolds',
        'inputBottomHeight',
        'inputFoldShadowAmount'
      ]);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        [
          'Time',
          'NumberOfFolds',
          'BottomHeight',
          'FoldShadowAmount',
        ],
      );
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputNumberOfFolds', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputNumberOfFolds') as NumberParameter;
      expect(parameter.value, 3);
      configuration.numberOfFolds = 5;
      expect(parameter.value, 5);
    });
    test('change inputBottomHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBottomHeight') as NumberParameter;
      expect(parameter.value, 0);
      configuration.numberOfFolds = 0.4;
      expect(parameter.value, 0.4);
    });
    test('change inputFoldShadowAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputFoldShadowAmount')
          as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.numberOfFolds = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
