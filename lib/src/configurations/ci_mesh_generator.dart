part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a mesh generator filter.
///
/// * [mesh] updates the `inputMesh` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [color] updates the `inputColor` value of filter.
///
/// See also:
///
///  * [CIMeshGenerator](https://developer.apple.com/documentation/coreimage/cimeshgenerator), which
///    defines the exact information for filter.
class CIMeshGeneratorConfiguration extends CIFilterConfiguration {
  final VectorParameter _mesh;
  final NumberParameter _width;
  final ColorParameter _color;

  /// Create a [CIMeshGeneratorConfiguration] with default values.
  CIMeshGeneratorConfiguration()
    : _mesh = CIVectorParameter('inputMesh', 'Mesh', []),
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

  /// An array that describes the mesh to render.
  ///
  /// Defaults to `[]`.
  set mesh(List<double> value) {
    _mesh.value = value;
  }

  /// The width of the effect.
  ///
  /// Defaults to `1.5`.
  ///
  /// Range: `0.0` to `10.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The color of the rendered mesh.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.generator,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_mesh, _width, _color];
}
