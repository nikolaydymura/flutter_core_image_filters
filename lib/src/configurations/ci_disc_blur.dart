part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDiscBlur filter.
class CIDiscBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIDiscBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          8,
          min: 0,
          max: 100,
        ),
        super('CIDiscBlur');

  /// Set the radius
  ///
  /// The default value is `8`
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
