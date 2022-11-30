part of flutter_core_image_filters;

class CIBoxBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIBoxBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 1,
          max: 100,
        ),
        super('CIBoxBlur');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
