import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import 'input_keys_metadata.dart';

void testInputKeys({required CIFilterConfiguration Function() build}) {
  test('verify inputKeys', () {
    final configuration = build();
    final parameters =
        configuration.parameters.map((e) => e.name).toSet().sorted();
    final metadataKeys = inputKeys[configuration.name]
        ?.whereNot((e) => e == 'inputImage')
        .sorted();
    expect(
      parameters,
      metadataKeys,
    );
    final names =
        configuration.parameters.map((e) => e.displayName).toSet().sorted();
    final metadataNames = inputKeysDisplayNames[configuration.name]
        ?.whereNot((e) => e == 'Image')
        .sorted();
    expect(
      names,
      metadataNames,
    );
  });
}
