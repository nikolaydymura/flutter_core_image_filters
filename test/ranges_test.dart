import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'metadata/ranges.dart';

/*
        let items = CIFilter.filterNames(inCategory: nil).map { name in
            let filter = CIFilter(name: name)!
            let defaults = filter.inputKeys.map { key in
                let input = filter.attributes[key] as! [String: Any]
                if "\(input["CIAttributeClass"]!)" == "NSNumber" {
                    var min: Double? = nil
                    if let attributeMin = input["CIAttributeMin"] as? NSNumber {
                        min = attributeMin.doubleValue
                    }
                    if let attributeMin = input["CIAttributeMin"] as? NSString {
                        min = attributeMin.doubleValue
                    }
                    if let sliderMin = input["CIAttributeSliderMin"] as? NSNumber {
                        if sliderMin.doubleValue <= (min ?? sliderMin.doubleValue) {
                            min = sliderMin.doubleValue
                        }
                    }

                    var max: Double? = nil
                    if let attributeMax = input["CIAttributeMax"] as? NSNumber {
                        max = attributeMax.doubleValue
                    }
                    if let attributeMax = input["CIAttributeMax"] as? NSString {
                        max = attributeMax.doubleValue
                    }
                    if let sliderMax = input["CIAttributeSliderMax"] as? NSNumber {
                        if sliderMax.doubleValue >= (max ?? sliderMax.doubleValue) {
                            max = sliderMax.doubleValue
                        }
                    }
                    if min == nil && max == nil {
                        return nil
                    }
                    guard let finalMin = min else {
                        return "'\(key)':  {'max': \(max!) }"
                    }
                    guard let finalMax = max else {
                        return "'\(key)':  { 'min': \(finalMin)}"
                    }
                    return "'\(key)':  { 'min': \(finalMin), 'max': \(finalMax) }"
                }

                return nil
            }.flatMap { $0 }.joined(separator: ",")

            return "'\(name)': {\(defaults)}"
        }
        print(items.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    final configuration =
        FlutterCoreImageFilters.createFilter(displayName: displayName);
    bool noParams = displayName == 'Lookup Table' ||
        configuration.parameters.whereType<RangeNumberParameter>().isEmpty;
    if (noParams) {
      continue;
    }
    final numParams =
        configuration.parameters.whereType<RangeNumberParameter>();
    for (final numParam in numParams) {
      test(
        'ranges for ${numParam.name} values of `${configuration.name}`',
        () {
          final paramValues = kInputRanges[configuration.name];
          expect(paramValues, isNotNull);
          final Map<String, double>? number = paramValues?[numParam.name];
          expect(
            number,
            isNotNull,
            reason:
                '${numParam.name} in ${configuration.name}',
          );
          expect(
            numParam.min,
            number?['min'],
            reason:
                '${numParam.name} in ${configuration.name} has invalid minimum',
          );
          expect(
            numParam.max,
            number?['max'],
            reason:
                '${numParam.name} in ${configuration.name} has invalid maximum',
          );
        },
      );
    }
  }
}
