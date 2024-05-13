part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a torus lens distortion filter.
///
/// * [width] updates the `inputWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [refraction] updates the `inputRefraction` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CITorusLensDistortion](https://developer.apple.com/documentation/coreimage/citoruslensdistortion), which
///    defines the exact information for filter.
class CITorusLensDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _refraction;
  final NumberParameter _radius;

  /// Create a [CITorusLensDistortionConfiguration] with default values.
  CITorusLensDistortionConfiguration()
      : _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          80,
          min: 0,
          max: 200,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _refraction = SliderNSNumberParameter(
          'inputRefraction',
          'Refraction',
          1.7,
          min: 0,
          max: 5,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          160,
          min: 0,
          max: 500,
        ),
        super('CITorusLensDistortion');

  /// The width.
  ///
  /// Defaults to `80.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The center.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The refraction.
  ///
  /// Defaults to `1.7`.
  ///
  /// Range: `0.0` to `5.0`.
  set refraction(double value) {
    _refraction.value = value;
  }

  /// The radius.
  ///
  /// Defaults to `160.0`.
  ///
  /// Range: `0.0` to `500.0`.
  set radius(double value) {
    _radius.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_width, _center, _refraction, _radius];
}
