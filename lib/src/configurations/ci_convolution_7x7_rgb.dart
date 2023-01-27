part of flutter_core_image_filters;

class CIConvolution7X7RGBConfiguration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final VectorParameter _weights;

  CIConvolution7X7RGBConfiguration()
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
          ],
        ),
        super('CIConvolution7X7RGB');

  set bias(double value) {
    _bias.value = value;
  }

  set weights(List<double> value) {
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
