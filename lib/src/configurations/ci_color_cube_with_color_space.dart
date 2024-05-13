part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color cube with color space filter.
///
/// * [extrapolate] updates the `inputExtrapolate` value of filter.
///
/// See also:
///
///  * [CIColorCubeWithColorSpace](https://developer.apple.com/documentation/coreimage/cicolorcubewithcolorspace), which
///    defines the exact information for filter.
class CIColorCubeWithColorSpaceConfiguration extends CIFilterConfiguration
    with CubeDimensionMixin, ColorSpaceMixin, CubeDataMixin {
  final BoolParameter _extrapolate;

  /// Create a [CIColorCubeWithColorSpaceConfiguration] with default values.
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
