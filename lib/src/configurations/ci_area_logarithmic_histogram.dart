part of flutter_core_image_filters;

class CIAreaLogarithmicHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _minimumStop;
  final NumberParameter _maximumStop;
  final RectParameter _extent;
  final NumberParameter _count;

  CIAreaLogarithmicHistogramConfiguration()
      : _minimumStop = SliderNSNumberParameter(
          'inputMinimumStop',
          'MinimumStop',
          -10,
          min: -12,
          max: -4,
        ),
        _maximumStop = SliderNSNumberParameter(
          'inputMaximumStop',
          'MaximumStop',
          4,
          min: 0,
          max: 8,
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        _count = SliderNSNumberParameter(
          'inputCount',
          'Count',
          64,
          min: 10,
          max: 1000,
        ),
        super('CIAreaLogarithmicHistogram');

  set minimumStop(double value) {
    _minimumStop.value = value;
  }

  set maximumStop(double value) {
    _maximumStop.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  set count(double value) {
    _count.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_minimumStop, _maximumStop, _extent, _count];
}
