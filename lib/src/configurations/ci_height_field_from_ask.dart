part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a height-field-from-mask filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIHeightFieldFromMask](https://developer.apple.com/documentation/coreimage/ciheightfieldfrommask), which
///    defines the exact information for filter.
class CIHeightFieldFromMaskConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIHeightFieldFromMaskConfiguration] with default values.
  CIHeightFieldFromMaskConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 300,
        ),
        super('CIHeightFieldFromMask');

  /// The length of the height-field transition.
  ///
  /// Defaults to `10.0`.
  ///
  /// Range: `0.0` to `300.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
