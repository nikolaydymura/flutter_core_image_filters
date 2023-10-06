part of flutter_core_image_filters;

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
