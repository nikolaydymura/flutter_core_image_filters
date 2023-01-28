part of flutter_core_image_filters;

class CIColorCubeWithColorSpaceConfiguration extends CIFilterConfiguration
    with CubeDataMixin {
  final NumberParameter _cubeDimension;
  final BoolParameter _extrapolate;
  final StringParameter _colorSpace;

  CIColorCubeWithColorSpaceConfiguration()
      : _cubeDimension = SliderNSIntegerParameter(
          'inputCubeDimension',
          'Cube Dimension',
          2,
          min: 2,
          max: 64,
        ),
        _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        _colorSpace = NSStringParameter('inputColorSpace', 'Color Space', ''),
        super('CIColorCubeWithColorSpace');

  set colorSpace(String value) {
    _colorSpace.value = value;
  }

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
      [_cubeDimension, _cubeData, _extrapolate, _colorSpace];
}
