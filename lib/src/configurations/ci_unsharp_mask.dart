part of flutter_core_image_filters;

class CIUnsharpMaskConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  CIUnsharpMaskConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          2.5,
          min: 0,
          max: 100,
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIUnsharpMask');

  set radius(double value) {
    _radius.value = value;
  }

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
