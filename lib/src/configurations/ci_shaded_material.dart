part of flutter_core_image_filters;

class CIShadedMaterialConfiguration extends CIFilterConfiguration
    with ShadingImageMixin {
  final NumberParameter _scale;

  CIShadedMaterialConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          10,
          min: 0.0,
          max: 200,
        ),
        super('CIShadedMaterial');

  set scale(double value) {
    _scale.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _shadingImage];
}
