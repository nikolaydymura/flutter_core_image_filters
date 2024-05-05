part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDotScreen filter.
class CIDotScreenConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _sharpness;

  CIDotScreenConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          6,
          min: 1,
          max: 50,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.7,
          min: 0,
          max: 1,
        ),
        super('CIDotScreen');

  /// Set the angle
  ///
  /// The default value is `0`
  set angle(double value) {
    _angle.value = value;
  }

  /// Set the width
  ///
  /// The default value is `6`
  set width(double value) {
    _width.value = value;
  }

  /// Set the center
  ///
  /// The default value is `(150.0, 150.0)`
  set center(Point<double> value) {
    _center.value = value;
  }

  /// Set the sharpness
  ///
  /// The default value is `0.7`
  set sharpness(double value) {
    _sharpness.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.halftoneEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_angle, _width, _center, _sharpness];
}
