part of flutter_core_image_filters;

class CIColorClampConfiguration extends CIFilterConfiguration {
  final VectorParameter _maxComponents;
  final VectorParameter _minComponents;

  CIColorClampConfiguration()
      : _maxComponents = CIVectorParameter(
          'inputMaxComponents',
          'Max Components',
          [1, 1, 1, 1],
        ),
        _minComponents = CIVectorParameter(
          'inputMinComponents',
          'Min Components',
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
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_maxComponents, _minComponents];
}
