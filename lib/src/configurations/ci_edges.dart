part of flutter_core_image_filters;

class CIEdgesConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIEdgesConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 10,
        ),
        super('CIEdges');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
