part of '../../flutter_core_image_filters.dart';

/// A configuration for a CICircularScreen filter.
class CICircularScreenConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _sharpness;
  final NumberParameter _width;

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

  /// The center of the screen.
  ///
  /// Defaults to (150.0, 150.0).
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The sharpness of the screen.
  ///
  /// This value ranges from 0.0 to 1.0.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  /// The width of the screen.
  ///
  /// This value ranges from 1.0 to 50.0.
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
