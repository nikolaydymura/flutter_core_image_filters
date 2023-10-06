part of flutter_core_image_filters;

class CIPalettizeConfiguration extends CIFilterConfiguration
    with PaletteImageMixin {
  final BoolParameter _perceptual;

  CIPalettizeConfiguration()
      : _perceptual = NSBoolParameter(
          'inputPerceptual',
          'Perceptual',
          false,
        ),
        super('CIPalettize');

  set perceptual(bool value) {
    _perceptual.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_perceptual, _paletteImage];
}
