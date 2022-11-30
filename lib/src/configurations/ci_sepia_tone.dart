part of flutter_core_image_filters;

class CISepiaToneConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CISepiaToneConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 1,
        ),
        super('CISepiaTone');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
