part of flutter_core_image_filters;

class CIMotionBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _angle;

  CIMotionBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          20,
          min: 0,
          max: 100,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIMotionBlur');

  set radius(double value) {
    _radius.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _angle];
}
