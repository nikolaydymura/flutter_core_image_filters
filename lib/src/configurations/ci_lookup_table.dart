part of flutter_core_image_filters;

class CILookupTableConfiguration extends CIFilterConfiguration {
  final NumberParameter _dimension;
  final RectParameter _size;
  final RangeNumberParameter _intensity;
  final DataParameter _lut;

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
        _lut = CIImageParameter('inputImage2', 'Image 2'),
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

  set lutData(Uint8List value) {
    _lut.data = value;
    _lut.asset = null;
    _lut.file = null;
  }

  set lutAsset(String value) {
    _lut.data = null;
    _lut.asset = value;
    _lut.file = null;
  }

  set lutFile(File value) {
    _lut.data = null;
    _lut.asset = null;
    _lut.file = value;
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
      [_size, _dimension, _intensity, _lut];
}
