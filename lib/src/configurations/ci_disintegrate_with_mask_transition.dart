part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a disintegrate-with-mask transition filter.
///
/// * [time] updates the `inputTime` value of filter.
/// * [shadowOffset] updates the `inputShadowOffset` value of filter.
/// * [shadowDensity] updates the `inputShadowDensity` value of filter.
/// * [shadowRadius] updates the `inputShadowRadius` value of filter.
///
/// See also:
///
///  * [CIDisintegrateWithMaskTransition](https://developer.apple.com/documentation/coreimage/cidisintegratewithmasktransition), which
///    defines the exact information for filter.
class CIDisintegrateWithMaskTransitionConfiguration
    extends CIFilterConfiguration
    with TargetImageMixin, MaskImageMixin {
  final NumberParameter _time;
  final PointParameter _shadowOffset;
  final NumberParameter _shadowDensity;
  final NumberParameter _shadowRadius;

  /// Create a [CIDisintegrateWithMaskTransitionConfiguration] with default values.
  CIDisintegrateWithMaskTransitionConfiguration()
    : _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
      _shadowOffset = CGPositionParameter(
        'inputShadowOffset',
        'Shadow Offset',
        const Point(0, -10),
      ),
      _shadowDensity = SliderNSNumberParameter(
        'inputShadowDensity',
        'Shadow Density',
        0.65,
        min: 0,
        max: 1,
      ),
      _shadowRadius = SliderNSNumberParameter(
        'inputShadowRadius',
        'Shadow Radius',
        8,
        min: 0,
        max: 50,
      ),
      super('CIDisintegrateWithMaskTransition');

  /// Set the time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The offset of the shadow the mask creates.
  ///
  /// The default value is `Point(0, -10)`.
  set shadowOffset(Point<double> value) {
    _shadowOffset.value = value;
  }

  /// The density of the shadow the mask creates.
  ///
  /// Defaults to `0.65`.
  ///
  /// Range: `0.0` to `1.0`.
  set shadowDensity(double value) {
    _shadowDensity.value = value;
  }

  /// The radius of the shadow the mask creates.
  ///
  /// Defaults to `8.0`.
  ///
  /// Range: `0.0` to `50.0`.
  set shadowRadius(double value) {
    _shadowRadius.value = value;
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
    _time,
    _shadowOffset,
    _shadowDensity,
    _shadowRadius,
    _targetImage,
    _maskImage,
  ];
}
