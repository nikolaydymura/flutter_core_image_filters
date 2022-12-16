part of flutter_core_image_filters;

class CIVignetteConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;
  final NumberParameter _radius;

  CIVignetteConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0,
          min: -1,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          1,
          min: 0,
          max: 2,
        ),
        super('CIVignette');

  set intensity(double value) {
    _intensity.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _radius];
}
