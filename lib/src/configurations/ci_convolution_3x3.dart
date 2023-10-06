part of flutter_core_image_filters;

class CIConvolution3X3Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final Mat3Parameter _weights;

  CIConvolution3X3Configuration()
      : _bias = NSNumberParameter('inputBias', 'Bias', 0),
        _weights = _Mat3Parameter(
          'inputWeights',
          'Weights',
          Matrix3.fromList([0, 0, 0, 0, 1, 0, 0, 0, 0]),
        ),
        super('CIConvolution3X3');

  set bias(double value) {
    _bias.value = value;
  }

  set weights(Matrix3 value) {
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
