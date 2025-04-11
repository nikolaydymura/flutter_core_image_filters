part of '../../flutter_core_image_filters.dart';

class CILookupTableConfiguration extends CIFilterConfiguration
    with Image2Mixin {
  final RangeNumberParameter _intensity;

  CILookupTableConfiguration()
    : _intensity = SliderNSNumberParameter(
        'inputIntensity',
        'Intensity',
        1.0,
        min: 0.0,
        max: 1.0,
      ),
      super('CISquareLookupTable');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorEffect,
    CICategory.video,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _image2];
}
