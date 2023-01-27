part of flutter_core_image_filters;

mixin CubeDataMixin on CIFilterConfiguration {
  final DataParameter _cubeData = NSDataParameter('inputCubeData', 'Cube Data');

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

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _cubeData];
// coverage:ignore-end
}
