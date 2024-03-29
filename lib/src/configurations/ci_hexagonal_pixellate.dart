part of flutter_core_image_filters;

class CIHexagonalPixellateConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final PointParameter _center;

  CIHexagonalPixellateConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          8,
          min: 1,
          max: 100,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIHexagonalPixellate');

  set scale(double value) {
    _scale.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
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
  List<ConfigurationParameter> get parameters => [_scale, _center];
}
