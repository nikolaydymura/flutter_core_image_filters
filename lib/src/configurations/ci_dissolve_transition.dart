part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDissolveTransition filter.
class CIDissolveTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;

  CIDissolveTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        super('CIDissolveTransition');

  /// Set the time
  ///
  /// Values are clamped to the range [0, 1]. The default value is `0`
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
