part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a box blur filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIBoxBlur](https://developer.apple.com/documentation/coreimage/ciboxblur), which
///    defines the exact information for filter.
class CIBoxBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIBoxBlurConfiguration] with default values.
  CIBoxBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 1,
          max: 100,
        ),
        super('CIBoxBlur');

  /// The radius of the blur, in pixels.
  ///
  /// Defaults to `10.0`.
  ///
  /// This value ranges from `1.0` to `100.0`.
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
