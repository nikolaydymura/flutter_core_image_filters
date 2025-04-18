part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a fourfold translated tile filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [acuteAngle] updates the `inputAcuteAngle` value of filter.
/// * [width] updates the `inputWidth` value of filter.
///
/// See also:
///
///  * [CIFourfoldTranslatedTile](https://developer.apple.com/documentation/coreimage/cifourfoldtranslatedtile), which
///    defines the exact information for filter.
class CIFourfoldTranslatedTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _angle;
  final NumberParameter _acuteAngle;
  final NumberParameter _width;

  /// Create a [CIFourfoldTranslatedTileConfiguration] with default values.
  CIFourfoldTranslatedTileConfiguration()
    : _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        0,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      _acuteAngle = SliderNSNumberParameter(
        'inputAcuteAngle',
        'Acute Angle',
        1.570796326794897,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      _width = SliderNSNumberParameter(
        'inputWidth',
        'Width',
        100,
        min: 0,
        max: 200,
      ),
      super('CIFourfoldTranslatedTile');

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The angle, in radians, of the tiled pattern.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The primary angle for the repeating translated tile.
  ///
  /// Defaults to `1.570796326794897`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set acuteAngle(double value) {
    _acuteAngle.value = value;
  }

  /// The width of a tile.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set width(double value) {
    _width.value = value;
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
  List<ConfigurationParameter> get parameters => [
    _center,
    _angle,
    _acuteAngle,
    _width,
  ];
}
