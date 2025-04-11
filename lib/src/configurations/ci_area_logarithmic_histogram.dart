part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color area logarithmic histogram filter.
///
/// * [minimumStop] updates the `inputMinimumStop` value of filter.
/// * [maximumStop] updates the `inputMaximumStop` value of filter.
/// * [scale] updates the `inputScale` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
/// * [count] updates the `inputCount` value of filter.
///
/// See also:
///
///  * [CIAreaLogarithmicHistogram](https://developer.apple.com/documentation/coreimage/ciarealogarithmichistogram), which
///    defines the exact information for filter.
class CIAreaLogarithmicHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _minimumStop;
  final NumberParameter _maximumStop;
  final NumberParameter _scale;
  final RectParameter _extent;
  final NumberParameter _count;

  /// Create a [CIAreaLogarithmicHistogramConfiguration] with default values.
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

  /// The minimum stop value.
  ///
  /// Defaults to `-10.0`.
  ///
  /// This value ranges from `-12.0` to `-4.0`.
  set minimumStop(double value) {
    _minimumStop.value = value;
  }

  /// The maximum stop value.
  ///
  /// Defaults to `4.0`.
  ///
  /// This value ranges from `0.0` to `8.0`.
  set maximumStop(double value) {
    _maximumStop.value = value;
  }

  /// The extent of the histogram.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 640, 80)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The count of the area to average.
  ///
  /// Defaults to `64.0`.
  ///
  /// This value ranges from `1.0` to `2048.0`.
  set count(double value) {
    _count.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.reduction,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _minimumStop,
    _maximumStop,
    _extent,
    _count,
    _scale,
  ];
}
