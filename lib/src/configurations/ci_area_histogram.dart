part of flutter_core_image_filters;

class CIAreaHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _count;
  final RectParameter _extent;

  CIAreaHistogramConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0,
          min: 0,
          max: 1,
        ),
        _count = SliderNSNumberParameter(
          'inputCount',
          'Count',
          64,
          min: 10,
          max: 1000,
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        super('CIAreaHistogram');

  set scale(double value) {
    _scale.value = value;
  }

  set count(double value) {
    _count.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scale, _count, _extent];
}
