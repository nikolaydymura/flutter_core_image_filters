part of flutter_core_image_filters;

class CIDitherConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIDitherConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.1,
          min: 0,
          max: 5,
        ),
        super('CIDither');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
