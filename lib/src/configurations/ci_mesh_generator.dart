part of flutter_core_image_filters;

class CIMeshGeneratorConfiguration extends CIFilterConfiguration {
  final VectorParameter _mesh;
  final NumberParameter _width;
  final ColorParameter _color;

  CIMeshGeneratorConfiguration()
      : _mesh = CIVectorParameter(
          'inputMesh',
          'Mesh',
          [],
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          1.5,
          min: 0,
          max: 10,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        super('CIMeshGenerator');

  @override
  bool get hasInputImage => false;

  set mesh(List<double> value) {
    _mesh.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_mesh, _width, _color];
}
