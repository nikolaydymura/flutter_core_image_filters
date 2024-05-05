part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAreaHistogram filter.
class CIAreaHistogramConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _count;
  final RectParameter _extent;

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
  /// This value ranges from 0.0 to 1.0.
  set scale(double value) {
    _scale.value = value;
  }

  /// The number of bins in the histogram.
  ///
  /// This value ranges from 1 to 2048.
  set count(double value) {
    _count.value = value;
  }

  /// The extent of the area to average.
  ///
  /// The extent is specified in pixels.
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
