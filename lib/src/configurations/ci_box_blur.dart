part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBoxBlur filter.
class CIBoxBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIBoxBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 1,
          max: 100,
        ),
        super('CIBoxBlur');

  /// The radius of the blur.
  ///
  /// This value ranges from 1.0 to 100.0.
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
