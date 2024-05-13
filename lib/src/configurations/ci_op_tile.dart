part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an optical tile filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [scale] updates the `inputScale` value of filter.
///
/// See also:
///
///  * [CIOpTile](https://developer.apple.com/documentation/coreimage/cioptile), which
///    defines the exact information for filter.
class CIOpTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _width;
  final NumberParameter _angle;
  final NumberParameter _scale;

  /// Create a [CIOpTileConfiguration] with default values.
  CIOpTileConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          65,
          min: 0,
          max: 1000,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          2.8,
          min: 0.0,
          max: 10,
        ),
        super('CIOpTile');

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The width of a tile.
  ///
  /// Defaults to `65.0`.
  ///
  /// Range: `0.0` to `1000.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The angle of a tile.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// A value that determines the number of tiles in the effect.
  ///
  /// Defaults to `2.8`.
  ///
  /// Range: `0.0` to `10.0`.
  set scale(double value) {
    _scale.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_center, _width, _angle, _scale];
}
