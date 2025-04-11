part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIConvolutionRGB3X3 filter.
class CIConvolutionRGB3X3Configuration extends CIFilterConfiguration {
  final NumberParameter _bias;
  final Mat3Parameter _weights;

  CIConvolutionRGB3X3Configuration()
    : _bias = NSNumberParameter('inputBias', 'Bias', 0),
      _weights = _Mat3Parameter(
        'inputWeights',
        'Weights',
        Matrix3.fromList([0, 0, 0, 0, 1, 0, 0, 0, 0]),
      ),
      super('CIConvolutionRGB3X3');

  /// The bias value.
  ///
  /// Defaults to 0.
  set bias(double value) {
    _bias.value = value;
  }

  /// The weights matrix.
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
