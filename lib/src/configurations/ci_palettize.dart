part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a palettize filter.
///
/// * [perceptual] updates the `inputPerceptual` value of filter.
///
/// See also:
///
///  * [CIPalettize](https://developer.apple.com/documentation/coreimage/cipalettize), which
///    defines the exact information for filter.
class CIPalettizeConfiguration extends CIFilterConfiguration
    with PaletteImageMixin {
  final BoolParameter _perceptual;

  /// Create a [CIPalettizeConfiguration] with default values.
  CIPalettizeConfiguration()
      : _perceptual = NSBoolParameter(
          'inputPerceptual',
          'Perceptual',
          false,
        ),
        super('CIPalettize');

  /// A Boolean value that specifies whether the filter applies the color palette in a perceptual color space.
  ///
  /// Defaults to `false`.
  set perceptual(bool value) {
    _perceptual.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_perceptual, _paletteImage];
}
