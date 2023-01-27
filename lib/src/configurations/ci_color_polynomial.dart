part of flutter_core_image_filters;

class CIColorPolynomialConfiguration extends CIFilterConfiguration {
  final VectorParameter _redCoefficients;
  final VectorParameter _greenCoefficients;
  final VectorParameter _alphaCoefficients;

  final VectorParameter _blueCoefficients;

  CIColorPolynomialConfiguration()
      : _redCoefficients = CIVectorParameter(
          'inputRedCoefficients',
          'Red Coefficients',
          [0, 1, 0, 0],
        ),
        _greenCoefficients = CIVectorParameter(
          'inputGreenCoefficients',
          'Green Coefficients',
          [0, 1, 0, 0],
        ),
        _alphaCoefficients = CIVectorParameter(
          'inputAlphaCoefficients',
          'Alpha Coefficients',
          [0, 1, 0, 0],
        ),
        _blueCoefficients = CIVectorParameter(
          'inputBlueCoefficients',
          'Blue Coefficients',
          [0, 1, 0, 0],
        ),
        super('CIColorPolynomial');

  set redCoefficients(List<double> value) {
    _redCoefficients.value = value;
  }

  set greenCoefficients(List<double> value) {
    _greenCoefficients.value = value;
  }

  set blueCoefficients(List<double> value) {
    _blueCoefficients.value = value;
  }

  set alphaCoefficients(List<double> value) {
    _alphaCoefficients.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _redCoefficients,
        _greenCoefficients,
        _alphaCoefficients,
        _blueCoefficients
      ];
}
