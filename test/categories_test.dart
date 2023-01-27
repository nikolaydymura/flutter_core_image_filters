import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'metadata/categories.dart';

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
    bool ignore = displayName == 'Lookup Table';
    test(
      'categories of `$displayName`',
      () {
        final configuration =
            FlutterCoreImageFilters.createFilter(displayName: displayName);
        final categories =
            configuration.categories.map((e) => e.displayName).toSet();
        final ciCategories = kCategories[configuration.name]?.toSet();
        expect(ciCategories, isNotNull);
        expect(categories, ciCategories?.toSet());
      },
      skip: ignore,
    );
  }
}
