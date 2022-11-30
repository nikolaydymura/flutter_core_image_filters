part of flutter_core_image_filters;

class CIColorCubeConfiguration extends CIFilterConfiguration {
  final NumberParameter _cubeDimension;
  final DataParameter _cubeData;

  CIColorCubeConfiguration()
      : _cubeDimension =
            NSNumberParameter('inputCubeDimension', 'Cube Dimension', 2),
        _cubeData = NSDataParameter('inputCubeData', 'Cube Data'),
        super('CIColorCube');

  set cubeDimension(int value) {
    _cubeDimension.value = value;
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
  List<ConfigurationParameter> get parameters => [_cubeDimension, _cubeData];
}
