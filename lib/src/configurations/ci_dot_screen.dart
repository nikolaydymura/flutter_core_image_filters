part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a dot screen filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [sharpness] updates the `inputSharpness` value of filter.
///
/// See also:
///
///  * [CIDotScreen](https://developer.apple.com/documentation/coreimage/cidotscreen), which
///    defines the exact information for filter.
class CIDotScreenConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _sharpness;

  /// Create a [CIDotScreenConfiguration] with default values.
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

  /// The angle of the pattern.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The distance between dots in the pattern.
  ///
  /// Defaults to `6.0`.
  ///
  /// Range: `1.0` to `50.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The x and y position to use as the center of the dot screen pattern.
  ///
  /// The default value is `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The sharpness of the pattern.
  ///
  /// Defaults to `0.7`.
  ///
  /// Range: `0.0` to `1.0`.
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
  List<ConfigurationParameter> get parameters => [
    _angle,
    _width,
    _center,
    _sharpness,
  ];
}
