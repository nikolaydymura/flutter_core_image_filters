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
          min: 1,
          max: 10,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        super('CIMeshGenerator');

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
  List<ConfigurationParameter> get parameters => [_mesh, _width, _color];
}
