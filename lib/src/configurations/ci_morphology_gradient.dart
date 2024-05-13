part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a morphology gradient filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIMorphologyGradient](https://developer.apple.com/documentation/coreimage/cimorphologygradient), which
///    defines the exact information for filter.
class CIMorphologyGradientConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIMorphologyGradientConfiguration] with default values.
  CIMorphologyGradientConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          5,
          min: 0,
          max: 50,
        ),
        super('CIMorphologyGradient');

  /// The radius of the circular morphological structuring element.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `0.0` to `50.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
