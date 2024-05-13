part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a false color filter.
///
/// * [color0] updates the `inputColor0` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
///
/// See also:
///
///  * [CIFalseColor](https://developer.apple.com/documentation/coreimage/cifalsecolor), which
///    defines the exact information for filter.
class CIFalseColorConfiguration extends CIFilterConfiguration {
  final ColorParameter _color0;
  final CIColorParameter _color1;

  /// Create a [CIFalseColorConfiguration] with default values.
  CIFalseColorConfiguration()
      : _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        super('CIFalseColor');

  /// The first color to use for the color ramp.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 1.0)`.
  set color0(Color value) {
    _color0.value = value;
  }

  /// The second color to use for the color ramp.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 1.0)`.
  set color1(Color value) {
    _color1.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_color0, _color1];
}
