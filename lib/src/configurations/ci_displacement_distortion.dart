part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a displacement distortion filter.
///
/// * [scale] updates the `inputScale` value of filter.
///
/// See also:
///
///  * [CIDisplacementDistortion](https://developer.apple.com/documentation/coreimage/cidisplacementdistortion), which
///    defines the exact information for filter.
class CIDisplacementDistortionConfiguration extends CIFilterConfiguration
    with DisplacementImageMixin {
  final NumberParameter _scale;

  /// Create a [CIDisintegrateWithMaskTransitionConfiguration] with default values.
  CIDisplacementDistortionConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          50,
          min: 0,
          max: 200,
        ),
        super('CIDisplacementDistortion');

  /// Set the scale.
  ///
  /// Defaults to `50.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set scale(double value) {
    _scale.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _displacementImage];
}
