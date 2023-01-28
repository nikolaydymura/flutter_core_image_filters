part of flutter_core_image_filters;

class CILanczosScaleTransformConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _aspectRatio;

  CILanczosScaleTransformConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          1,
          min: 0.0,
          max: 1.5,
        ),
        _aspectRatio = SliderNSNumberParameter(
          'inputAspectRatio',
          'Aspect Ratio',
          1,
          min: 0.0,
          max: 2,
        ),
        super('CILanczosScaleTransform');

  set scale(double value) {
    _scale.value = value;
  }

  set aspectRatio(double value) {
    _aspectRatio.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _aspectRatio];
}
