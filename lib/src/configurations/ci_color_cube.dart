part of flutter_core_image_filters;

class CIColorCubeConfiguration extends CIFilterConfiguration
    with CubeDataMixin {
  final NumberParameter _cubeDimension;
  final BoolParameter _extrapolate;

  CIColorCubeConfiguration()
      : _cubeDimension = SliderNSIntegerParameter(
          'inputCubeDimension',
          'Cube Dimension',
          2,
          min: 2,
          max: 64,
        ),
        _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCube');

  set cubeDimension(int value) {
    _cubeDimension.value = value;
  }

  set extrapolate(bool value) {
    _extrapolate.value = value;
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
      [_cubeDimension, _cubeData, _extrapolate];
}
