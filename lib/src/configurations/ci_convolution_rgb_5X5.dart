part of flutter_core_image_filters;

class CIConvolutionRGB5X5Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final VectorParameter _weights;

  CIConvolutionRGB5X5Configuration()
      : _bias = NSNumberParameter('inputBias', 'Bias', 0),
        _weights = CIVectorParameter(
          'inputWeights',
          'Weights',
          [
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
            0
          ],
        ),
        super('CIConvolutionRGB5X5');

  set bias(double value) {
    _bias.value = value;
  }

  set weights(List<double> value) {
    _weights.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_bias, _weights];
}