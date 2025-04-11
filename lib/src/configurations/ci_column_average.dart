part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a column average filter.
///
/// * [extent] updates the `inputExtent` value of filter.
///
/// See also:
///
///  * [CIColumnAverage](https://developer.apple.com/documentation/coreimage/cicolumnaverage), which
///    defines the exact information for filter.
class CIColumnAverageConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  /// Create a [CIColumnAverageConfiguration] with default values.
  CIColumnAverageConfiguration()
    : _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 640, 80),
      ),
      super('CIColumnAverage');

  /// The extent of the columns to average.
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
