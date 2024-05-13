part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a shaded material filter.
///
/// * [scale] updates the `inputScale` value of filter.
///
/// See also:
///
///  * [CIShadedMaterial](https://developer.apple.com/documentation/coreimage/cishadedmaterial), which
///    defines the exact information for filter.
class CIShadedMaterialConfiguration extends CIFilterConfiguration
    with ShadingImageMixin {
  final NumberParameter _scale;

  /// Create a [CIShadedMaterialConfiguration] with default values.
  CIShadedMaterialConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          10,
          min: 0.0,
          max: 200,
        ),
        super('CIShadedMaterial');

  /// The scale of the effect.
  ///
  /// Defaults to `10.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set scale(double value) {
    _scale.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _shadingImage];
}
