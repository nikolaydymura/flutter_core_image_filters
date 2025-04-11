part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a Glass lozenge filter.
///
/// * [refraction] updates the `inputRefraction` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [point0] updates the `inputPoint0` value of filter.
/// * [point1] updates the `inputPoint1` value of filter.
///
/// See also:
///
///  * [CIGlassLozenge](https://developer.apple.com/documentation/coreimage/ciglasslozenge), which
///    defines the exact information for filter.
class CIGlassLozengeConfiguration extends CIFilterConfiguration {
  final NumberParameter _refraction;
  final NumberParameter _radius;
  final PointParameter _point0;
  final PointParameter _point1;

  /// Create a [CIGlassLozengeConfiguration] with default values.
  CIGlassLozengeConfiguration()
    : _refraction = SliderNSNumberParameter(
        'inputRefraction',
        'Refraction',
        1.7,
        min: 0,
        max: 5,
      ),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        100,
        min: 0,
        max: 1000,
      ),
      _point0 = CGPositionParameter(
        'inputPoint0',
        'Point 0',
        const Point(150.0, 150.0),
      ),
      _point1 = CGPositionParameter(
        'inputPoint1',
        'Point 1',
        const Point(350.0, 150.0),
      ),
      super('CIGlassLozenge');

  /// The refraction of the filter.
  ///
  /// Defaults to `1.7`.
  ///
  /// Range: `0.0` to `5.0`.
  set refraction(double value) {
    _refraction.value = value;
  }

  /// The radius of the filter.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.0` to `1000.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The point0 of the filter.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set point0(Point<double> value) {
    _point0.value = value;
  }

  /// The point1 of the filter.
  ///
  /// Defaults to `Point(350.0, 150.0)`.
  set point1(Point<double> value) {
    _point1.value = value;
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
  List<ConfigurationParameter> get parameters => [
    _refraction,
    _radius,
    _point0,
    _point1,
  ];
}
