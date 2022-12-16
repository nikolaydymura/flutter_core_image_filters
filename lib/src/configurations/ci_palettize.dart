part of flutter_core_image_filters;

class CIPalettizeConfiguration extends CIFilterConfiguration
    with PaletteImageMixin {
  final NumberParameter _perceptual;

  CIPalettizeConfiguration()
      : _perceptual = SliderNSNumberParameter(
          'inputPerceptual',
          'Perceptual',
          0,
          min: 0,
          max: 1,
        ),
        super('CIPalettize');

  set perceptual(double value) {
    _perceptual.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_perceptual, _paletteImage];
}
