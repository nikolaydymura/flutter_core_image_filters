part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorCrossPolynomial filter.
class CIColorCrossPolynomialConfiguration extends CIFilterConfiguration {
  final VectorParameter _redCoefficients;
  final VectorParameter _greenCoefficients;
  final VectorParameter _blueCoefficients;

  CIColorCrossPolynomialConfiguration()
      : _redCoefficients = CIVectorParameter(
          'inputRedCoefficients',
          'Red Coefficients',
          [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        _greenCoefficients = CIVectorParameter(
          'inputGreenCoefficients',
          'Green Coefficients',
          [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        _blueCoefficients = CIVectorParameter(
          'inputBlueCoefficients',
          'Blue Coefficients',
          [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        super('CIColorCrossPolynomial');

  /// The red coefficients.
  ///
  /// Defaults to [1, 0, 0, 0, 0, 0, 0, 0, 0, 0].
  set redCoefficients(List<double> value) {
    _redCoefficients.value = value;
  }

  /// The green coefficients.
  ///
  /// Defaults to [0, 1, 0, 0, 0, 0, 0, 0, 0, 0].
  set greenCoefficients(List<double> value) {
    _greenCoefficients.value = value;
  }

  /// The blue coefficients.
  ///
  /// Defaults to [0, 0, 1, 0, 0, 0, 0, 0, 0, 0].
  set blueCoefficients(List<double> value) {
    _blueCoefficients.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_redCoefficients, _greenCoefficients, _blueCoefficients];
}
