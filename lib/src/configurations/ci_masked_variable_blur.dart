part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a masked variable blur filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIMaskedVariableBlur](https://developer.apple.com/documentation/coreimage/cimaskedvariableblur), which
///    defines the exact information for filter.
class CIMaskedVariableBlurConfiguration extends CIFilterConfiguration
    with MaskImageMixin {
  final NumberParameter _radius;

  @override
  String get _maskImageInputKey => 'inputMask';

  @override
  String get _maskImageInputName => 'Mask';

  /// Create a [CIMaskedVariableBlurConfiguration] with default values.
  CIMaskedVariableBlurConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        5,
        min: 0,
        max: 10,
      ),
      super('CIMaskedVariableBlur');

  /// The distance from the center of the effect.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `0.0` to `10.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.blur,
    CICategory.stillImage,
    CICategory.video,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _maskImage];
}
