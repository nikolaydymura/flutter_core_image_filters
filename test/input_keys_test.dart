import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'metadata/input_keys.dart';

/*
let categories = CIFilter.filterNames(inCategory: nil).map { name in
    let filter = CIFilter(name: name)!
    let cats = filter.attributes["CIAttributeFilterCategories"] as! [String]
    return "'\(name)': [\(cats.map{ c in "'\(c)'"}.joined(separator: ","))]"
}
print(categories.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    bool ignore =
        displayName.contains('Lookup Table') ||
        displayName == 'Barcode Generator' ||
        displayName == 'Depth Blur Effect';
    test('inputKeys of `$displayName`', () {
      final configuration = FlutterCoreImageFilters.createFilter(
        displayName: displayName,
      );
      final inputKeys = configuration.parameters.map((e) => e.name).toSet();
      final ciInputKeys =
          kInputKeys[configuration.name]
              ?.whereNot((e) => e == 'inputImage')
              .toSet();
      expect(ciInputKeys, isNotNull);
      expect(inputKeys, ciInputKeys?.toSet());
    }, skip: ignore);
  }
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    bool ignore =
        displayName.contains('Lookup Table') ||
        displayName == 'Barcode Generator' ||
        displayName == 'Depth Blur Effect';
    test('display name for inputKeys of `$displayName`', () {
      final configuration = FlutterCoreImageFilters.createFilter(
        displayName: displayName,
      );
      final displayNames =
          configuration.parameters.map((e) => e.displayName).toSet();
      final ciDisplayNames =
          kInputKeysDisplayNames[configuration.name]
              ?.whereNot((e) => e == 'Image')
              .toSet();
      expect(ciDisplayNames, isNotNull);
      expect(displayNames, ciDisplayNames?.toSet());
    }, skip: ignore);
  }
}
