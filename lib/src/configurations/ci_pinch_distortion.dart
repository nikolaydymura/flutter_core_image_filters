part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a pinch distortion filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [scale] updates the `inputScale` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIPinchDistortion](https://developer.apple.com/documentation/coreimage/cipinchdistortion), which
///    defines the exact information for filter.
class CIPinchDistortionConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _scale;
  final NumberParameter _radius;

  /// Create a [CIPinchDistortionConfiguration] with default values.
  CIPinchDistortionConfiguration()
    : _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _scale = SliderNSNumberParameter(
        'inputScale',
        'Scale',
        0.5,
        min: 0,
        max: 2,
      ),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        300,
        min: 0,
        max: 1000,
      ),
      super('CIPinchDistortion');

  /// The center.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The scale.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `2.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The radius.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.0` to `1000.0`.
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
  List<ConfigurationParameter> get parameters => [_center, _scale, _radius];
}
