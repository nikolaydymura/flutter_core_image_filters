part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a dissolve transition filter.
///
/// * [time] updates the `inputTime` value of filter.
///
/// See also:
///
///  * [CIDissolveTransition](https://developer.apple.com/documentation/coreimage/cidissolvetransition), which
///    defines the exact information for filter.
class CIDissolveTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;

  /// Create a [CIDissolveTransitionConfiguration] with default values.
  CIDissolveTransitionConfiguration()
    : _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
      super('CIDissolveTransition');

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.transition,
    CICategory.video,
    CICategory.stillImage,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_time, _targetImage];
}
