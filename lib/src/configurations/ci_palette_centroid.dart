part of flutter_core_image_filters;

class CIPaletteCentroidConfiguration extends CIFilterConfiguration
    with PaletteImageMixin {
  final NumberParameter _perceptual;

  CIPaletteCentroidConfiguration()
      : _perceptual = SliderNSNumberParameter(
          'inputPerceptual',
          'Perceptual',
          0,
          min: 0,
          max: 1,
        ),
        super('CIPaletteCentroid');

  set perceptual(double value) {
    _perceptual.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_perceptual, _paletteImage];
}
