part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDisplacementDistortion filter.
class CIDisplacementDistortionConfiguration extends CIFilterConfiguration
    with DisplacementImageMixin {
  final NumberParameter _scale;

  CIDisplacementDistortionConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          50,
          min: 0,
          max: 200,
        ),
        super('CIDisplacementDistortion');

  /// Set the scale
  ///
  /// The default value is `50`
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
