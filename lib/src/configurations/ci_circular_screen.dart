part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a circular screen filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [sharpness] updates the `inputSharpness` value of filter.
/// * [width] updates the `inputWidth` value of filter.
///
/// See also:
///
///  * [CICircularScreen](https://developer.apple.com/documentation/coreimage/cicircularscreen), which
///    defines the exact information for filter.
class CICircularScreenConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _sharpness;
  final NumberParameter _width;

  /// Create a [CICircularScreenConfiguration] with default values.
  CICircularScreenConfiguration()
    : _center = CGPositionParameter(
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
      _width = SliderNSNumberParameter(
        'inputWidth',
        'Width',
        6,
        min: 1,
        max: 50,
      ),
      super('CICircularScreen');

  /// The x and y position to use as the center of the circular screen pattern.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The sharpness of the circles.
  ///
  /// Defaults to `0.7`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  /// The distance between each circle in the pattern.
  ///
  /// Defaults to `6.0`.
  ///
  /// This value ranges from `1.0` to `50.0`.
  set width(double value) {
    _width.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.halftoneEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_center, _sharpness, _width];
}
