part of flutter_core_image_filters;

class CILookupTableConfiguration extends CIFilterConfiguration
    with Image2Mixin {
  final NumberParameter _dimension;
  final RectParameter _size;
  final RangeNumberParameter _intensity;

  CILookupTableConfiguration()
      : _dimension = NSNumberParameter('inputSize', 'Size', 64),
        _size = CGRectParameter(
          'inputRect',
          'Rect',
          const Rect.fromLTRB(0, 0, 8, 8),
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1.0,
          min: 0.0,
          max: 1.0,
        ),
        super('CILookupTable');

  set size(int value) {
    _dimension.value = value;
  }

  set rows(int value) {
    _size.value = Rect.fromLTRB(0, 0, _size.value.width, value.toDouble());
  }

  set columns(int value) {
    _size.value = Rect.fromLTRB(0, 0, value.toDouble(), _size.value.height);
  }

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
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_size, _dimension, _intensity, _image2];
}
