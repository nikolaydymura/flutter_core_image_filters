part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a row average filter.
///
/// * [extent] updates the `inputExtent` value of filter.
///
/// See also:
///
///  * [CIRowAverage](https://developer.apple.com/documentation/coreimage/cirowaverage), which
///    defines the exact information for filter.
class CIRowAverageConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  /// Create a [CIRowAverageConfiguration] with default values.
  CIRowAverageConfiguration()
    : _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 640, 80),
      ),
      super('CIRowAverage');

  /// The extent.
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
