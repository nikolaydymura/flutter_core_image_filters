part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIClamp filter.
class CIClampConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  CIClampConfiguration()
    : _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 640, 80),
      ),
      super('CIClamp');

  /// The extent of the clamp.
  ///
  /// Defaults to a rectangle with origin (0, 0) and size (640, 80).
  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.tileEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
