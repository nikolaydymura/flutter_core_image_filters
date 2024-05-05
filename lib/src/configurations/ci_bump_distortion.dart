part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBumpDistortion filter.
class CIBumpDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _scale;
  final PointParameter _center;

  CIBumpDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 600,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0.5,
          min: -1,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIBumpDistortion');

  /// The radius of the distortion.
  ///
  /// This value ranges from 0.0 to 600.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The scale of the distortion.
  ///
  /// This value ranges from -1.0 to 1.0.
  set scale(double value) {
    _scale.value = value;
  }

  /// The center of the distortion.
  ///
  /// Defaults to (150.0, 150.0).
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
  List<ConfigurationParameter> get parameters => [_radius, _scale, _center];
}
