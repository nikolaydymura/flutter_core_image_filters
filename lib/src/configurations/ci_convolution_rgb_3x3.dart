part of flutter_core_image_filters;

class CIConvolutionRGB3X3Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final Mat3Parameter _weights;

  CIConvolutionRGB3X3Configuration()
      : _bias = NSNumberParameter('inputBias', 'Bias', 0),
        _weights = Mat3Parameter(
          'inputWeights',
          'Weights',
          Mat3([0, 0, 0, 0, 1, 0, 0, 0, 0]),
        ),
        super('CIConvolutionRGB3X3');

  set bias(double value) {
    _bias.value = value;
  }

  set weights(Mat3 value) {
    _weights.value = value;
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
  List<ConfigurationParameter> get parameters => [_bias, _weights];
}
