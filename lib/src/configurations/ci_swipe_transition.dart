part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a swipe transition filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
/// * [opacity] updates the `inputOpacity` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [width] updates the `inputWidth` value of filter.
///
/// See also:
///
///  * [CISwipeTransition](https://developer.apple.com/documentation/coreimage/ciswipetransition), which
///    defines the exact information for filter.
class CISwipeTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _angle;
  final ColorParameter _color;
  final RectParameter _extent;
  final NumberParameter _opacity;
  final NumberParameter _time;
  final NumberParameter _width;

  /// Create a [CISwipeTransitionConfiguration] with default values.
  CISwipeTransitionConfiguration()
    : _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        0,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 255, 255, 1.0),
      ),
      _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 300, 300),
      ),
      _opacity = SliderNSNumberParameter(
        'inputOpacity',
        'Opacity',
        0,
        min: 0,
        max: 1,
      ),
      _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
      _width = SliderNSNumberParameter(
        'inputWidth',
        'Width',
        300,
        min: 0.1,
        max: 800,
      ),
      super('CISwipeTransition');

  /// The angle of the swipe.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The color of the swipe.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1.0)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The opacity of the swipe.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set opacity(double value) {
    _opacity.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The width of the swipe.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.1` to `800.0`.
  set width(double value) {
    _width.value = value;
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
  List<ConfigurationParameter> get parameters => [
    _angle,
    _color,
    _extent,
    _opacity,
    _time,
    _width,
    _targetImage,
  ];
}
