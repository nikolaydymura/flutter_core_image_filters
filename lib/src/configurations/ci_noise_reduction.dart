part of flutter_core_image_filters;

class CINoiseReductionConfiguration extends CIFilterConfiguration {
  final NumberParameter _noiseLevel;
  final NumberParameter _sharpness;

  CINoiseReductionConfiguration()
      : _noiseLevel = SliderNSNumberParameter(
          'inputNoiseLevel',
          'Noise Level',
          0.02,
          min: 0,
          max: 0.1,
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.4,
          min: 0,
          max: 2,
        ),
        super('CINoiseReduction');

  set noiseLevel(double value) {
    _noiseLevel.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_noiseLevel, _sharpness];
}
