part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a white-point adjust filter.
///
/// * [color] updates the `inputColor` value of filter.
///
/// See also:
///
///  * [CIWhitePointAdjust](https://developer.apple.com/documentation/coreimage/ciwhitepointadjust), which
///    defines the exact information for filter.
class CIWhitePointAdjustConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;

  /// Create a [CIWhitePointAdjustConfiguration] with default values.
  CIWhitePointAdjustConfiguration()
    : _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 255, 255, 1.0),
      ),
      super('CIWhitePointAdjust');

  /// A color to use as the white point.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1.0)`.
  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_color];
}
