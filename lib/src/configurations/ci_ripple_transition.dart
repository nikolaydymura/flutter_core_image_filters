part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a ripple transition filter.
///
/// * [extent] updates the `inputExtent` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [scale] updates the `inputScale` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIRippleTransition](https://developer.apple.com/documentation/coreimage/cirippletransition), which
///    defines the exact information for filter.
class CIRippleTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin, ShadingImageMixin {
  final RectParameter _extent;
  final NumberParameter _time;
  final NumberParameter _scale;
  final NumberParameter _width;
  final PointParameter _center;

  /// Create a [CIRippleTransitionConfiguration] with default values.
  CIRippleTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(
            0,
            0,
            300,
            300,
          ),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          50,
          min: -50,
          max: 50,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          100,
          min: 1,
          max: 300,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIRippleTransition');

  /// A rectangle that defines the extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// A value that determines whether the ripple starts as a bulge (a higher value) or a dimple (a lower value).
  ///
  /// Defaults to `50.0`.
  ///
  /// Range: `-50.0` to `50.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The width of the ripple.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `1.0` to `300.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
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
        _extent,
        _time,
        _scale,
        _width,
        _center,
        _shadingImage,
        _targetImage,
      ];
}
