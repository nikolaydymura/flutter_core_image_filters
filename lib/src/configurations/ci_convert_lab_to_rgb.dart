part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIConvertLabToRGB filter.
class CIConvertLabToRGBConfiguration extends CIFilterConfiguration {
  final BoolParameter _normalize;

  CIConvertLabToRGBConfiguration()
    : _normalize = NSBoolParameter('inputNormalize', 'Normalize', false),
      super('CIConvertLabToRGB');

  /// A Boolean value that, if true, specifies that the input color values are normalized.
  set normalize(bool value) {
    _normalize.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorEffect,
    CICategory.video,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_normalize];
}
