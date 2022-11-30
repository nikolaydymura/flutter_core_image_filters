part of flutter_core_image_filters;

class CIPaletteCentroidConfiguration extends CIFilterConfiguration {
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
  List<ConfigurationParameter> get parameters => [_perceptual];
}
