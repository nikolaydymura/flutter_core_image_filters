part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a hole distortion filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIHoleDistortion](https://developer.apple.com/documentation/coreimage/ciholedistortion), which
///    defines the exact information for filter.
class CIHoleDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  /// Create a [CIHoleDistortionConfiguration] with default values.
  CIHoleDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0.01,
          max: 1000,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIHoleDistortion');

  /// The radius.
  ///
  /// Defaults to `150.0`.
  ///
  /// Range: `0.01` to `1000.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _center];
}
