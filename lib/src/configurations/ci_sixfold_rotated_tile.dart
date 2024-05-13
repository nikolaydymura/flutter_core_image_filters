part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a sixfold rotated tile filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [width] updates the `inputWidth` value of filter.
///
/// See also:
///
///  * [CISixfoldRotatedTile](https://developer.apple.com/documentation/coreimage/cisixfoldrotatedtile), which
///    defines the exact information for filter.
class CISixfoldRotatedTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _width;
  final NumberParameter _angle;

  /// Create a [CISixfoldRotatedTileConfiguration] with default values.
  CISixfoldRotatedTileConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          100,
          min: 0,
          max: 200,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CISixfoldRotatedTile');

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The width of a tile.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The angle, in radians, of the tiled pattern.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_center, _width, _angle];
}
