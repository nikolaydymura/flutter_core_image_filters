part of flutter_core_image_filters;

class CIConvolutionRGB5X5Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final Mat5Parameter _weights;

  CIConvolutionRGB5X5Configuration()
      : _bias = NSNumberParameter('inputBias', 'Bias', 0),
        _weights = _Mat5Parameter(
          'inputWeights',
          'Weights',
          Mat5([
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
          ]),
        ),
        super('CIConvolutionRGB5X5');

  set bias(double value) {
    _bias.value = value;
  }

  set weights(Mat5 value) {
    _weights.value = value;
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
  List<ConfigurationParameter> get parameters => [_bias, _weights];
}
