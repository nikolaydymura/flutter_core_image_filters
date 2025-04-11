part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a CMYK halftone filter.
///
/// * [gCR] updates the `inputGCR` value of filter.
/// * [uCR] updates the `inputUCR` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [sharpness] updates the `inputSharpness` value of filter.
///
/// See also:
///
///  * [CICMYKHalftone](https://developer.apple.com/documentation/coreimage/cicmykhalftone), which
///    defines the exact information for filter.
class CICMYKHalftoneConfiguration extends CIFilterConfiguration {
  final NumberParameter _gCR;
  final NumberParameter _uCR;
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _angle;
  final NumberParameter _sharpness;

  /// Create a [CICMYKHalftoneConfiguration] with default values.
  CICMYKHalftoneConfiguration()
    : _gCR = SliderNSNumberParameter(
        'inputGCR',
        'Gray Component Replacement',
        1,
        min: 0,
        max: 1,
      ),
      _uCR = SliderNSNumberParameter(
        'inputUCR',
        'Under Color Removal',
        0.5,
        min: 0,
        max: 1,
      ),
      _width = SliderNSNumberParameter(
        'inputWidth',
        'Width',
        6,
        min: -2,
        max: 100,
      ),
      _center = CGPositionParameter(
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
      _sharpness = SliderNSNumberParameter(
        'inputSharpness',
        'Sharpness',
        0.7,
        min: 0.0,
        max: 1,
      ),
      super('CICMYKHalftone');

  /// The gray component replacement value.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set gCR(double value) {
    _gCR.value = value;
  }

  /// The under color removal value.
  ///
  /// Defaults to `0.5`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set uCR(double value) {
    _uCR.value = value;
  }

  /// The distance between dots in the pattern.
  ///
  /// Defaults to `6.0`.
  ///
  /// This value ranges from `-2.0` to `100.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The x and y position to use as the center of the halftone pattern.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The angle of the pattern.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The sharpness of the pattern.
  ///
  /// Defaults to `0.7`.
  ///
  /// This value ranges from `0.0` to `1.0`.
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
    _gCR,
    _uCR,
    _width,
    _center,
    _angle,
    _sharpness,
  ];
}
