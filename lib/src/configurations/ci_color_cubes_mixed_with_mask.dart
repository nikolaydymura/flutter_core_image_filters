part of flutter_core_image_filters;

class CIColorCubesMixedWithMaskConfiguration extends CIFilterConfiguration
    with MaskImageMixin, CubeDimensionMixin, ColorSpaceMixin {
  final CubeDataParameter _cubeData0;
  final CubeDataParameter _cubeData1;
  final BoolParameter _extrapolate;

  CIColorCubesMixedWithMaskConfiguration()
      : _cubeData0 = CubeDataParameter('inputCube0Data', 'Cube 0 Data'),
        _cubeData1 = CubeDataParameter('inputCube1Data', 'Cube 1 Data'),
        _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCubesMixedWithMask');

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

  set cubeData0Image(bool value) {
    _cubeData0.image = value;
  }

  set cubeData0Size(int value) {
    _cubeData0.size = value;
  }

  set cubeData0Columns(int value) {
    _cubeData0.columns = value;
  }

  set cubeData0Rows(int value) {
    _cubeData0.rows = value;
  }

  set cubeData1Image(bool value) {
    _cubeData1.image = value;
  }

  set cubeData1Size(int value) {
    _cubeData1.size = value;
  }

  set cubeData1Columns(int value) {
    _cubeData1.columns = value;
  }

  set cubeData1Rows(int value) {
    _cubeData1.rows = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        ...super.parameters,
        _cubeData0,
        _cubeData1,
        _extrapolate,
      ];
}
