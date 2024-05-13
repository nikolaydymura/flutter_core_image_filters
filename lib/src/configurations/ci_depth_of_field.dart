part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a depth-of-field filter.
///
/// * [point1] updates the `inputPoint1` value of filter.
/// * [unsharpMaskRadius] updates the `inputUnsharpMaskRadius` value of filter.
/// * [saturation] updates the `inputSaturation` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [unsharpMaskIntensity] updates the `inputUnsharpMaskIntensity` value of filter.
/// * [point0] updates the `inputPoint0` value of filter.
///
/// See also:
///
///  * [CIDepthOfField](https://developer.apple.com/documentation/coreimage/cidepthoffield), which
///    defines the exact information for filter.
class CIDepthOfFieldConfiguration extends CIFilterConfiguration {
  final PointParameter _point1;
  final NumberParameter _unsharpMaskRadius;
  final NumberParameter _saturation;
  final NumberParameter _radius;
  final NumberParameter _unsharpMaskIntensity;
  final PointParameter _point0;

  /// Create a [CIDepthOfFieldConfiguration] with default values.
  CIDepthOfFieldConfiguration()
      : _point1 = CGPositionParameter(
          'inputPoint1',
          'Point 1',
          const Point(300.0, 300.0),
        ),
        _unsharpMaskRadius = SliderNSNumberParameter(
          'inputUnsharpMaskRadius',
          'Unsharp Mask Radius',
          2.5,
          min: 0,
          max: 10,
        ),
        _saturation = SliderNSNumberParameter(
          'inputSaturation',
          'Saturation',
          1.5,
          min: 0,
          max: 10,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          6,
          min: 0,
          max: 30,
        ),
        _unsharpMaskIntensity = SliderNSNumberParameter(
          'inputUnsharpMaskIntensity',
          'Unsharp Mask Intensity',
          0.5,
          min: 0,
          max: 10,
        ),
        _point0 = CGPositionParameter(
          'inputPoint0',
          'Point 0',
          const Point(0, 300.0),
        ),
        super('CIDepthOfField');

  /// The second point in the focused region of the output image.
  ///
  /// The default value is `Point(300.0, 300.0)`.
  set point1(Point<double> value) {
    _point1.value = value;
  }

  /// The radius of the unsharp mask effect applied to the in-focus area.
  ///
  /// Defaults to `2.5`.
  ///
  /// Range: `0.0` to `10.0`.
  set unsharpMaskRadius(double value) {
    _unsharpMaskRadius.value = value;
  }

  /// The amount to adjust the saturation by.
  ///
  /// Defaults to `1.5`.
  ///
  /// Range: `0.0` to `10.0`.
  set saturation(double value) {
    _saturation.value = value;
  }

  /// The distance from the center of the effect.
  ///
  /// Defaults to `6.0`.
  ///
  /// Range: `0.0` to `30.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The intensity of the unsharp mask effect applied to the in-focus area.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `10.0`.
  set unsharpMaskIntensity(double value) {
    _unsharpMaskIntensity.value = value;
  }

  /// The first point in the focused region of the output image.
  ///
  /// The default value is `Point(0.0, 300.0)`.
  set point0(Point<double> value) {
    _point0.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _point1,
        _unsharpMaskRadius,
        _saturation,
        _radius,
        _unsharpMaskIntensity,
        _point0,
      ];
}
