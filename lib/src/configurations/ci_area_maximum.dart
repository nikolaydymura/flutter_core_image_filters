part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAreaMaximum filter.
class CIAreaMaximumConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  CIAreaMaximumConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 640, 80),
        ),
        super('CIAreaMaximum');

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
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
