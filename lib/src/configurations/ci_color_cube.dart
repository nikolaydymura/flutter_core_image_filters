part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorCube filter.
class CIColorCubeConfiguration extends CIFilterConfiguration
    with CubeDimensionMixin, CubeDataMixin {
  final BoolParameter _extrapolate;

  CIColorCubeConfiguration()
      : _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCube');

  /// Whether to extrapolate.
  ///
  /// Defaults to `false`.
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
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _extrapolate];
}
