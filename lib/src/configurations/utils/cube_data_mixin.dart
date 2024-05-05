part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a cube data parameter to a filter configuration.
mixin CubeDataMixin on CIFilterConfiguration {
  final CubeDataParameter _cubeData =
      CubeDataParameter('inputCubeData', 'Cube Data');

  /// The cube data
  ///
  /// If this is set, [cubeDataAsset] and [cubeDataFile] will be null.
  set cubeData(Uint8List value) {
    _cubeData.data = value;
    _cubeData.asset = null;
    _cubeData.file = null;
  }

  /// The cube data asset
  ///
  /// If this is set, [cubeData] and [cubeDataFile] will be null.
  set cubeDataAsset(String value) {
    _cubeData.data = null;
    _cubeData.asset = value;
    _cubeData.file = null;
  }

  /// The cube data file
  ///
  /// If this is set, [cubeData] and [cubeDataAsset] will be null.
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

/// A mixin that provides a cube dimension parameter to a filter configuration.
mixin CubeDimensionMixin on CIFilterConfiguration {
  final NumberParameter _cubeDimension = SliderNSIntegerParameter(
    'inputCubeDimension',
    'Cube Dimension',
    2,
    min: 2,
    max: 64,
  );

  /// The cube dimension
  ///
  /// The default value is 2.
  set cubeDimension(int value) {
    _cubeDimension.value = value;
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _cubeDimension];
// coverage:ignore-end
}

/// A mixin that provides a color space parameter to a filter configuration.
mixin ColorSpaceMixin on CIFilterConfiguration {
  final OptionStringParameter<CGColorSpace> _colorSpace = CGColorSpaceParameter(
    'inputColorSpace',
    'Color Space',
    CGColorSpace.none,
  );

  /// The color space
  ///
  /// The default value is [CGColorSpace.none].
  set colorSpace(CGColorSpace value) {
    _colorSpace.value = value;
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _colorSpace];
// coverage:ignore-end
}
