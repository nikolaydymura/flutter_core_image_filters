part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color threshold filter.
///
/// * [threshold] updates the `inputThreshold` value of filter.
///
/// See also:
///
///  * [CIColorThreshold](https://developer.apple.com/documentation/coreimage/cicolorthreshold), which
///    defines the exact information for filter.
class CIColorThresholdConfiguration extends CIFilterConfiguration {
  final NumberParameter _threshold;

  /// Create a [CIColorThresholdConfiguration] with default values.
  CIColorThresholdConfiguration()
      : _threshold = SliderNSNumberParameter(
          'inputThreshold',
          'Threshold',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIColorThreshold');

  /// The threshold value.
  ///
  /// Defaults to `0.5`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set threshold(double value) {
    _threshold.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_threshold];
}
