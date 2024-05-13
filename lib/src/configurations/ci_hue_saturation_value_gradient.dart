part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a hue-saturation-value gradient filter.
///
/// * [dither] updates the `inputDither` value of filter.
/// * [softness] updates the `inputSoftness` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [value] updates the `inputValue` value of filter.
///
/// See also:
///
///  * [CIHueSaturationValueGradient](https://developer.apple.com/documentation/coreimage/cihuesaturationvaluegradient), which
///    defines the exact information for filter.
class CIHueSaturationValueGradientConfiguration extends CIFilterConfiguration
    with ColorSpaceMixin {
  final NumberParameter _dither;
  final NumberParameter _softness;
  final NumberParameter _radius;
  final NumberParameter _value;

  /// Create a [CIHueSaturationValueGradientConfiguration] with default values.
  CIHueSaturationValueGradientConfiguration()
      : _dither = SliderNSNumberParameter(
          'inputDither',
          'Dither',
          1,
          min: 0,
          max: 3,
        ),
        _softness = SliderNSNumberParameter(
          'inputSoftness',
          'Softness',
          1,
          min: 0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 800,
        ),
        _value = SliderNSNumberParameter(
          'inputValue',
          'Value',
          1,
          min: 0,
          max: 1,
        ),
        super('CIHueSaturationValueGradient');

  @override
  bool get hasInputImage => false;

  /// A Boolean value specifying whether the dither the generated output.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `3.0`.
  set dither(double value) {
    _dither.value = value;
  }

  /// The softness of the generated color wheel.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set softness(double value) {
    _softness.value = value;
  }

  /// The distance from the center of the effect.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The lightness of the hue-saturation gradient.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set value(double value) {
    _value.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.gradient,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _dither, _softness, _radius, _value];
}
