part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color area minimum alpha filter.
///
/// * [extent] updates the `inputExtent` value of filter.
///
/// See also:
///
///  * [CIAreaMinimumAlpha](https://developer.apple.com/documentation/coreimage/ciareaminimumalpha), which
///    defines the exact information for filter.
class CIAreaMinimumAlphaConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  /// Create a [CIAreaMinimumAlphaConfiguration] with default values.
  CIAreaMinimumAlphaConfiguration()
    : _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 640, 80),
      ),
      super('CIAreaMinimumAlpha');

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
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
