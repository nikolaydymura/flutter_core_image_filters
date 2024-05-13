part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color cube mixed with mask filter.
///
/// * [cubeData0] updates the `inputCube0Data` value of filter.
/// * [cubeData1] updates the `inputCube1Data` value of filter.
/// * [extrapolate] updates the `inputExtrapolate` value of filter.
///
/// See also:
///
///  * [CIColorCubesMixedWithMask](https://developer.apple.com/documentation/coreimage/cicolorcubesmixedwithmask), which
///    defines the exact information for filter.
class CIColorCubesMixedWithMaskConfiguration extends CIFilterConfiguration
    with MaskImageMixin, CubeDimensionMixin, ColorSpaceMixin {
  final CubeDataParameter _cubeData0;
  final CubeDataParameter _cubeData1;
  final BoolParameter _extrapolate;

  /// Create a [CIColorCubesMixedWithMaskConfiguration] with default values.
  CIColorCubesMixedWithMaskConfiguration()
      : _cubeData0 = CubeDataParameter('inputCube0Data', 'Cube 0 Data'),
        _cubeData1 = CubeDataParameter('inputCube1Data', 'Cube 1 Data'),
        _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCubesMixedWithMask');

  /// Whether to extrapolate.
  ///
  /// Defaults to `false`.
  set extrapolate(bool value) {
    _extrapolate.value = value;
  }

  /// The cube texture data to use as a color lookup table.
  set cubeData0(Uint8List value) {
    _cubeData0.data = value;
    _cubeData0.asset = null;
    _cubeData0.file = null;
  }

  /// The asset name for the first cube.
  set cubeData0Asset(String value) {
    _cubeData0.data = null;
    _cubeData0.asset = value;
    _cubeData0.file = null;
  }

  /// The file for the first cube.
  set cubeData0File(File value) {
    _cubeData0.data = null;
    _cubeData0.asset = null;
    _cubeData0.file = value;
  }

  /// The cube texture data to use as a color lookup table.
  set cubeData1(Uint8List value) {
    _cubeData1.data = value;
    _cubeData1.asset = null;
    _cubeData1.file = null;
  }

  /// The asset name for the second cube.
  set cubeData1Asset(String value) {
    _cubeData1.data = null;
    _cubeData1.asset = value;
    _cubeData1.file = null;
  }

  /// The file for the second cube.
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
