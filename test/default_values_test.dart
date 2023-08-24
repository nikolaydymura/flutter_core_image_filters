import 'dart:math';
import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:collection/collection.dart';
import 'metadata/default_values.dart';

/*
        let items = CIFilter.filterNames(inCategory: nil).map { name in
            let filter = CIFilter(name: name)!
            let defaults = filter.inputKeys.map { key in
                let input = filter.attributes[key] as! [String: Any]
                let defaultValue = input["CIAttributeDefault"]
                if let value = defaultValue as? NSNumber {
                    return "'\(key)': \(value)"
                } else if let value = defaultValue as? CIVector {
                    let array = "\(value)".replacingOccurrences(of: " ", with: ", ")
                    return "'\(key)': \(array)"
                } else if let value = defaultValue as? CIColor {
                    return "'\(key)': Color.fromRGBO(\(Int(value.red * 255)), \(Int(value.green * 255)), \(Int(value.blue * 255)), \(value.alpha))"
                } else if let value = defaultValue as? NSData {
                    return nil
                } else if let value = defaultValue as? CGAffineTransform {
                    return "'\(key)': [\(value.a),\(value.b),\(value.c),\(value.d),\(value.tx),\(value.ty)]"
                }
                if defaultValue == nil {
                    return nil
                }
                if key.hasPrefix("inputColorSpace") {
                    return "'\(key)': 'sRGB'"
                }
                return "'\(key)': '\(input["CIAttributeDefault"] ?? "")'"
            }.flatMap { $0 }.joined(separator: ",")

            return "'\(name)': {\(defaults)}"
        }
        print(items.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    final configuration =
        FlutterCoreImageFilters.createFilter(displayName: displayName);
    bool noParams = displayName.contains('Lookup Table') ||
        configuration.parameters.whereNot((e) => e is DataParameter).isEmpty;
    if (noParams) {
      continue;
    }
    test(
      'default bool values of `$displayName`',
      () {
        final boolParams = configuration.parameters.whereType<BoolParameter>();
        final paramValues = kDefaultValues[configuration.name];
        expect(paramValues, isNotNull);
        for (final boolParam in boolParams) {
          final num? value = paramValues?[boolParam.name];
          if (value == null) {
            expect(
              boolParam.value,
              false,
              reason:
                  '${boolParam.name} in ${configuration.name} has invalid default value',
            );
          } else {
            expect(
              boolParam.value,
              value == 1,
              reason:
                  '${boolParam.name} in ${configuration.name} has invalid default value',
            );
          }
        }
      },
    );
    test(
      'default number values of `$displayName`',
      () {
        final numParams = configuration.parameters.whereType<NumberParameter>();
        final paramValues = kDefaultValues[configuration.name];
        expect(paramValues, isNotNull);
        for (final numParam in numParams) {
          final num? number = paramValues?[numParam.name];
          if (number == null) {
            expect(
              numParam.value.isNaN,
              true,
              reason:
                  '${numParam.name} in ${configuration.name} has invalid default value',
            );
          } else {
            expect(
              numParam.value,
              number,
              reason:
                  '${numParam.name} in ${configuration.name} has invalid default value',
            );
          }
        }
      },
    );
    test(
      'default point values of `$displayName`',
      () {
        final paramValues = kDefaultValues[configuration.name];
        expect(paramValues, isNotNull);
        final pointParams =
            configuration.parameters.whereType<PointParameter>();
        for (final pointParam in pointParams) {
          final List<num>? array = paramValues?[pointParam.name];
          if (array == null) {
            expect(
              pointParam.value,
              const Point(0.0, 0.0),
              reason:
                  '${pointParam.name} in ${configuration.name} has invalid default value',
            );
          } else {
            expect(
              pointParam.values,
              array,
              reason:
                  '${pointParam.name} in ${configuration.name} has invalid default value',
            );
          }
        }
      },
    );

    test(
      'default rect values of `$displayName`',
      () {
        final paramValues = kDefaultValues[configuration.name];
        expect(paramValues, isNotNull);

        final rectParams = configuration.parameters.whereType<RectParameter>();
        for (final rectParam in rectParams) {
          final List<num>? array = paramValues?[rectParam.name];
          if (array == null) {
            expect(
              rectParam.value,
              const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0),
              reason:
                  '${rectParam.name} in ${configuration.name} has invalid default value',
            );
          } else {
            expect(
              rectParam.values,
              array,
              reason:
                  '${rectParam.name} in ${configuration.name} has invalid default value',
            );
          }
        }
      },
    );
    test(
      'default vector values of `$displayName`',
      () {
        final paramValues = kDefaultValues[configuration.name];
        expect(paramValues, isNotNull);
        final vectorParams =
            configuration.parameters.whereType<ListParameter>();
        for (final vectorParam in vectorParams) {
          final List<num>? array = paramValues?[vectorParam.name];
          if (array == null) {
            expect(
              vectorParam.value.isEmpty,
              true,
              reason:
                  '${vectorParam.name} in ${configuration.name} has invalid default value',
            );
          } else {
            expect(
              vectorParam.value,
              array,
              reason:
                  '${vectorParam.name} in ${configuration.name} has invalid default value',
            );
          }
        }
      },
    );
  }
}
