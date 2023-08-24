import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'metadata/names.dart';

/*
let items = CIFilter.filterNames(inCategory: nil).map { name in
    let filter = CIFilter(name: name)!
    let display = filter.attributes["CIAttributeFilterDisplayName"] as! String
    return "'\(name)': '\(display)'"
}
print(items.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    bool ignore = displayName.contains('Lookup Table');
    test(
      'core image name for `$displayName`',
      () {
        final configuration =
            FlutterCoreImageFilters.createFilter(displayName: displayName);
        final name = configuration.name;
        final cName = kNames[displayName];
        expect(cName, isNotNull);
        expect(name, cName);
      },
      skip: ignore,
    );
  }
}
