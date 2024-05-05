part of '../../flutter_core_image_filters.dart';

class CIGloomConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  CIGloomConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
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
        super('CIGloom');

  set radius(double value) {
    _radius.value = value;
  }

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
