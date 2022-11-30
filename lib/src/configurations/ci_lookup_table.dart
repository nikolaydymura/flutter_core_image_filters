part of flutter_core_image_filters;

class CILookupTableConfiguration extends CIFilterConfiguration {
  final NumberParameter _dimension;
  final SizeParameter _size;
  final RangeNumberParameter _intensity;
  final DataParameter _lut;

  CILookupTableConfiguration()
      : _dimension = NSNumberParameter('inputSize', 'Size', 8),
        _size = CGRectParameter('inputRect', 'Rect', const Size(8, 8)),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1.0,
          min: 0.0,
          max: 1.0,
        ),
        _lut = NSDataParameter('inputImage2', 'Image 2'),
        super('CILookupTable');

  set size(int value) {
    _dimension.value = value;
  }

  set rows(int value) {
    _size.value = Size(_size.value.width, value.toDouble());
  }

  set columns(int value) {
    _size.value = Size(value.toDouble(), _size.value.height);
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
  List<ConfigurationParameter> get parameters =>
      [_size, _dimension, _intensity, _lut];
}
