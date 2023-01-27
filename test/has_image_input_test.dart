import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'metadata/image_input.dart';

/*
let items = CIFilter.filterNames(inCategory: nil).map { name in
    let filter = CIFilter(name: name)!
    let hasImage = filter.inputKeys.contains(kCIInputImageKey)
    return "'\(name)': \(hasImage)"
}
print(items.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    bool ignore = displayName == 'Lookup Table';
    test('`$displayName` has image input', () {
      final configuration =
          FlutterCoreImageFilters.createFilter(displayName: displayName);
      final hasInputImage = configuration.hasInputImage;
      final ciHasImageInput = kHasImageInput[configuration.name];
      expect(ciHasImageInput, isNotNull);
      expect(hasInputImage, ciHasImageInput, reason: configuration.name);
    }, skip: ignore);
  }
}
