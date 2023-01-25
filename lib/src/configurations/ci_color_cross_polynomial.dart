part of flutter_core_image_filters;

class CIColorCrossPolynomialConfiguration extends CIFilterConfiguration {
  final VectorParameter _redCoefficients;
  final VectorParameter _greenCoefficients;
  final VectorParameter _blueCoefficients;

  CIColorCrossPolynomialConfiguration()
      : _redCoefficients = CIVectorParameter(
          'inputRedCoefficients',
          'RedCoefficients',
          [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        ),
        _greenCoefficients = CIVectorParameter(
          'inputGreenCoefficients',
          'GreenCoefficients',
          [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        ),
        _blueCoefficients = CIVectorParameter(
          'inputBlueCoefficients',
          'BlueCoefficients',
          [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
        ),
        super('ColorCrossPolynomial');

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
  List<ConfigurationParameter> get parameters =>
      [_redCoefficients, _greenCoefficients, _blueCoefficients];
}
