part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a morphology minimum filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIMorphologyMinimum](https://developer.apple.com/documentation/coreimage/cimorphologyminimum), which
///    defines the exact information for filter.
class CIMorphologyMinimumConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIMorphologyMinimumConfiguration] with default values.
  CIMorphologyMinimumConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          0,
          min: 0,
          max: 50,
        ),
        super('CIMorphologyMinimum');

  /// The properties you use to configure a morphology minimum filter.
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
