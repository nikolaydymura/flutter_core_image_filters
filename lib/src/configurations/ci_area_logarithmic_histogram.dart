part of flutter_core_image_filters;

class CIAreaLogarithmicHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _minimumStop;
  final NumberParameter _maximumStop;
  final NumberParameter _scale;
  final RectParameter _extent;
  final NumberParameter _count;

  CIAreaLogarithmicHistogramConfiguration()
      : _minimumStop = SliderNSNumberParameter(
          'inputMinimumStop',
          'Minimum Stop',
          -10,
          min: -12,
          max: -4,
        ),
        _maximumStop = SliderNSNumberParameter(
          'inputMaximumStop',
          'Maximum Stop',
          4,
          min: 0,
          max: 8,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          1,
          min: 0,
          max: 1,
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 640, 80),
        ),
        _count = SliderNSNumberParameter(
          'inputCount',
          'Count',
          64,
          min: 1,
          max: 2048,
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
  Iterable<CICategory> get categories => {
        CICategory.reduction,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_minimumStop, _maximumStop, _extent, _count, _scale];
}
