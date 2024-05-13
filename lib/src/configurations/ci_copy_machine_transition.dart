part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a copy machine transition filter.
///
/// * [time] updates the `inputTime` value of filter.
/// * [opacity] updates the `inputOpacity` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CICopyMachineTransition](https://developer.apple.com/documentation/coreimage/cicopymachinetransition), which
///    defines the exact information for filter.
class CICopyMachineTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _opacity;
  final ColorParameter _color;
  final RectParameter _extent;
  final NumberParameter _width;
  final NumberParameter _angle;

  /// Create a [CICopyMachineTransitionConfiguration] with default values.
  CICopyMachineTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _opacity = SliderNSNumberParameter(
          'inputOpacity',
          'Opacity',
          1.3,
          min: 0,
          max: 3,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(153, 225, 204, 1.0),
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 300, 300),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          200,
          min: 0.1,
          max: 500,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CICopyMachineTransition');

  /// The time value.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The opacity of the copier light.
  ///
  /// Defaults to `1.3`.
  ///
  /// This value ranges from `0.0` to `3.0`.
  set opacity(double value) {
    _opacity.value = value;
  }

  /// The color of the copier light.
  ///
  /// Defaults to `Color.fromRGBO(153, 225, 204, 1.0)`.
  set color(Color value) {
    _color.value = value;
  }

  /// A rectangle that defines the extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The width of the copier light.
  ///
  /// Defaults to `200.0`.
  ///
  /// This value ranges from `0.1` to `500.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The angle of the copier light.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range from `0.0` to `6.283185307179586`.
  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_time, _opacity, _color, _extent, _width, _angle, _targetImage];
}
