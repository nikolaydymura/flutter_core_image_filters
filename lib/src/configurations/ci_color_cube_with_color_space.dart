part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorCubeWithColorSpace filter.
class CIColorCubeWithColorSpaceConfiguration extends CIFilterConfiguration
    with CubeDimensionMixin, ColorSpaceMixin, CubeDataMixin {
  final BoolParameter _extrapolate;

  CIColorCubeWithColorSpaceConfiguration()
      : _extrapolate =
            NSBoolParameter('inputExtrapolate', 'Extrapolate', false),
        super('CIColorCubeWithColorSpace');

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
  List<ConfigurationParameter> get parameters => [
        ...super.parameters,
        _extrapolate,
      ];
}
