part of flutter_core_image_filters;

class CIVignetteConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIVignetteConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0,
          min: -1,
          max: 1,
        ),
        super('CIVignette');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
