part of flutter_core_image_filters;

class CIGuidedFilterConfiguration extends CIFilterConfiguration
    with GuideImageMixin {
  final NumberParameter _epsilon;
  final NumberParameter _radius;

  CIGuidedFilterConfiguration()
      : _epsilon = SliderNSNumberParameter(
          'inputEpsilon',
          'Epsilon',
          0.0001,
          min: 0.000000001,
          max: 0.1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          1,
          min: 1,
          max: 10,
        ),
        super('CIGuidedFilter');

  set epsilon(double value) {
    _epsilon.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_radius, _epsilon, _guideImage];
}
