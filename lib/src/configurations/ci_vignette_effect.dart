part of flutter_core_image_filters;

class CIVignetteEffectConfiguration extends CIFilterConfiguration {
  final NumberParameter _falloff;
  final NumberParameter _intensity;
  final PointParameter _center;
  final NumberParameter _radius;

  CIVignetteEffectConfiguration()
      : _falloff = SliderNSNumberParameter(
          'inputFalloff',
          'Falloff',
          0.5,
          min: 0,
          max: 1,
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: -1,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 2000,
        ),
        super('CIVignetteEffect');

  set falloff(double value) {
    _falloff.value = value;
  }

  set intensity(double value) {
    _intensity.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_falloff, _intensity, _center, _radius];
}
