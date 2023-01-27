part of flutter_core_image_filters;

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

  set redCoefficients(List<double> value) {
    _redCoefficients.value = value;
  }

  set greenCoefficients(List<double> value) {
    _greenCoefficients.value = value;
  }

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
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_redCoefficients, _greenCoefficients, _blueCoefficients];
}
