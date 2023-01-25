part of flutter_core_image_filters;

class CIColorClampConfiguration extends CIFilterConfiguration {
  final VectorParameter _maxComponents;
  final VectorParameter _minComponents;

  CIColorClampConfiguration()
      : _maxComponents = CIVectorParameter(
          'inputMaxComponents',
          'MaxComponents',
          [1, 1, 1, 1],
        ),
        _minComponents = CIVectorParameter(
          'inputMinComponents',
          'MinComponents',
          [0, 0, 0, 0],
        ),
        super('CIColorClamp');

  set maxComponents(List<double> value) {
    _maxComponents.value = value;
  }

  set minComponents(List<double> value) {
    _minComponents.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_maxComponents, _minComponents];
}
