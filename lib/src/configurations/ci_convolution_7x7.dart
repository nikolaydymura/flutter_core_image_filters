part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIConvolution7X7 filter.
class CIConvolution7X7Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final Mat7Parameter _weights;

  CIConvolution7X7Configuration()
    : _bias = NSNumberParameter('inputBias', 'Bias', 0),
      _weights = _Mat7Parameter(
        'inputWeights',
        'Weights',
        Mat7([
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
        ]),
      ),
      super('CIConvolution7X7');

  /// The bias value.
  ///
  /// Defaults to 0.
  set bias(double value) {
    _bias.value = value;
  }

  /// The weights matrix.
  set weights(Mat7 value) {
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
