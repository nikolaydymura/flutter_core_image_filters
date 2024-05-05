part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColumnAverage filter.
class CIColumnAverageConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  CIColumnAverageConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 640, 80),
        ),
        super('CIColumnAverage');

  /// The extent of the columns to average.
  ///
  /// Defaults to a rectangle with an origin of (0, 0) and a size of (640, 80).
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
