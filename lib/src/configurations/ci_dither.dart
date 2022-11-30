part of flutter_core_image_filters;

class CIDitherConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIDitherConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.1,
          min: 0,
          max: 1,
        ),
        super('CIDither');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
