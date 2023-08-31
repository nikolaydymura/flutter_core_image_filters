part of flutter_core_image_filters;

mixin CubeDataMixin on CIFilterConfiguration {
  final CubeDataParameter _cubeData =
      CubeDataParameter('inputCubeData', 'Cube Data');

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

  set cubeDataImage(bool value) {
    _cubeData.image = value;
  }

  set cubeDataSize(int value) {
    _cubeData.size = value;
  }

  set cubeDataColumns(int value) {
    _cubeData.columns = value;
  }

  set cubeDataRows(int value) {
    _cubeData.rows = value;
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _cubeData];
// coverage:ignore-end
}

mixin CubeDimensionMixin on CIFilterConfiguration {
  final NumberParameter _cubeDimension = SliderNSIntegerParameter(
    'inputCubeDimension',
    'Cube Dimension',
    2,
    min: 2,
    max: 64,
  );

  set cubeDimension(int value) {
    _cubeDimension.value = value;
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _cubeDimension];
// coverage:ignore-end
}

mixin ColorSpaceMixin on CIFilterConfiguration {
  final OptionStringParameter<CGColorSpace> _colorSpace = CGColorSpaceParameter(
    'inputColorSpace',
    'Color Space',
    CGColorSpace.none,
  );

  set colorSpace(CGColorSpace value) {
    _colorSpace.value = value;
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _colorSpace];
// coverage:ignore-end
}
