part of flutter_core_image_filters;

class CIColorCubeWithColorSpaceConfiguration extends CIFilterConfiguration {
  final NumberParameter _cubeDimension;
  final DataParameter _cubeData;
  final BoolParameter _extrapolate;
  final StringParameter _colorSpace;

  CIColorCubeWithColorSpaceConfiguration()
      : _cubeDimension =
            NSNumberParameter('inputCubeDimension', 'Cube Dimension', 2),
        _cubeData = NSDataParameter('inputCubeData', 'Cube Data'),
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

  set cubeData(Uint8List value) {
    _cubeData.data = value;
    _cubeData.asset = null;
    _cubeData.file = null;
  }

  set cubeDataAsset(String value) {
    _cubeData.data = null;
    _cubeData.asset = value;
    _cubeData.file = null;
  }

  set cubeDataFile(File value) {
    _cubeData.data = null;
    _cubeData.asset = null;
    _cubeData.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_cubeDimension, _cubeData, _extrapolate, _colorSpace];
}
