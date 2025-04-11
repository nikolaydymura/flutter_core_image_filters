part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color area histogram filter.
///
/// * [scale] updates the `inputScale` value of filter.
/// * [count] updates the `inputCount` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
///
/// See also:
///
///  * [CIAreaHistogram](https://developer.apple.com/documentation/coreimage/ciareahistogram), which
///    defines the exact information for filter.
class CIAreaHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _count;
  final RectParameter _extent;

  /// Create a [CIAreaHistogramConfiguration] with default values.
  CIAreaHistogramConfiguration()
    : _scale = SliderNSNumberParameter(
        'inputScale',
        'Scale',
        1,
        min: 0,
        max: 1,
      ),
      _count = SliderNSNumberParameter(
        'inputCount',
        'Count',
        64,
        min: 1,
        max: 2048,
      ),
      _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 640, 80),
      ),
      super('CIAreaHistogram');

  /// The scale of the histogram.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The number of bins in the histogram.
  ///
  /// Defaults to `64.0`.
  ///
  /// This value ranges from `1.0` to `2048.0`.
  set count(double value) {
    _count.value = value;
  }

  /// The extent of the area to average.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 640, 80)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.reduction,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _count, _extent];
}
