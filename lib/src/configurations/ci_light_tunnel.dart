part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a light tunnel filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [rotation] updates the `inputRotation` value of filter.
///
/// See also:
///
///  * [CILightTunnel](https://developer.apple.com/documentation/coreimage/cilighttunnel), which
///    defines the exact information for filter.
class CILightTunnelConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;
  final NumberParameter _rotation;

  /// Create a [CILightTunnelConfiguration] with default values.
  CILightTunnelConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        100,
        min: 1,
        max: 500,
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _rotation = SliderNSNumberParameter(
        'inputRotation',
        'Rotation',
        0,
        min: 0,
        max: 1.5707963267948966,
      ),
      super('CILightTunnel');

  /// The radius.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `1.0` to `500.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The rotation.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.5707963267948966`.
  set rotation(double value) {
    _rotation.value = value;
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
  List<ConfigurationParameter> get parameters => [_radius, _center, _rotation];
}
