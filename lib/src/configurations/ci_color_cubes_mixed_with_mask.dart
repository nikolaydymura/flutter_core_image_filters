part of flutter_core_image_filters;

class CIColorCubesMixedWithMaskConfiguration extends CIFilterConfiguration
    with MaskImageMixin {
  final NumberParameter _cubeDimension;
  final DataParameter _cubeData0;
  final DataParameter _cubeData1;
  final BoolParameter _extrapolate;
  final StringParameter _colorSpace;

  CIColorCubesMixedWithMaskConfiguration()
      : _cubeDimension = SliderNSIntegerParameter(
          'inputCubeDimension',
          'Cube Dimension',
          2,
          min: 2,
          max: 64,
        ),
        _cubeData0 = NSDataParameter('inputCube0Data', 'Cube 0 Data'),
        _cubeData1 = NSDataParameter('inputCube1Data', 'Cube 1 Data'),
        _colorSpace = NSStringParameter('inputColorSpace', 'Color Space', ''),
        _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCubesMixedWithMask');

  set colorSpace(String value) {
    _colorSpace.value = value;
  }

  set cubeDimension(int value) {
    _cubeDimension.value = value;
  }

  set extrapolate(bool value) {
    _extrapolate.value = value;
  }

  set cubeData0(Uint8List value) {
    _cubeData0.data = value;
    _cubeData0.asset = null;
    _cubeData0.file = null;
  }

  set cubeData0Asset(String value) {
    _cubeData0.data = null;
    _cubeData0.asset = value;
    _cubeData0.file = null;
  }

  set cubeData0File(File value) {
    _cubeData0.data = null;
    _cubeData0.asset = null;
    _cubeData0.file = value;
  }

  set cubeData1(Uint8List value) {
    _cubeData1.data = value;
    _cubeData1.asset = null;
    _cubeData1.file = null;
  }

  set cubeData1Asset(String value) {
    _cubeData1.data = null;
    _cubeData1.asset = value;
    _cubeData1.file = null;
  }

  set cubeData1File(File value) {
    _cubeData1.data = null;
    _cubeData1.asset = null;
    _cubeData1.file = value;
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
  List<ConfigurationParameter> get parameters => [
        _cubeDimension,
        _cubeData0,
        _cubeData1,
        _extrapolate,
        _colorSpace,
        _maskImage
      ];
}
