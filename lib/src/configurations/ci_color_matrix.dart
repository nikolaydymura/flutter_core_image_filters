part of flutter_core_image_filters;

class CIColorMatrixConfiguration extends CIFilterConfiguration {
  final VectorParameter _gVector;
  final VectorParameter _biasVector;
  final VectorParameter _rVector;
  final VectorParameter _aVector;
  final VectorParameter _bVector;

  CIColorMatrixConfiguration()
      : _gVector = CIVectorParameter(
          'inputGVector',
          'GVector',
          [0, 1, 0, 0],
        ),
        _biasVector = CIVectorParameter(
          'inputBiasVector',
          'BiasVector',
          [0, 0, 0, 0],
        ),
        _rVector = CIVectorParameter(
          'inputRVector',
          'RVector',
          [1, 0, 0, 0],
        ),
        _aVector = CIVectorParameter(
          'inputAVector',
          'AVector',
          [0, 0, 0, 1],
        ),
        _bVector = CIVectorParameter(
          'inputBVector',
          'BVector',
          [0, 0, 1, 0],
        ),
        super('CIColorMatrix');

  set gVector(List<double> value) {
    _gVector.value = value;
  }

  set biasVector(List<double> value) {
    _biasVector.value = value;
  }

  set rVector(List<double> value) {
    _rVector.value = value;
  }

  set aVector(List<double> value) {
    _rVector.value = value;
  }

  set bVector(List<double> value) {
    _rVector.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_gVector, _biasVector, _rVector, _aVector, _bVector];
}
