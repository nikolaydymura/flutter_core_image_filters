part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a morphology maximum filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIMorphologyMaximum](https://developer.apple.com/documentation/coreimage/cimorphologymaximum), which
///    defines the exact information for filter.
class CIMorphologyMaximumConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIMorphologyMaximumConfiguration] with default values.
  CIMorphologyMaximumConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        0,
        min: 0,
        max: 50,
      ),
      super('CIMorphologyMaximum');

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
