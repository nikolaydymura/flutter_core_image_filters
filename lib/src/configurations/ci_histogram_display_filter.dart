part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a histogram display filter.
///
/// * [lowLimit] updates the `inputLowLimit` value of filter.
/// * [highLimit] updates the `inputHighLimit` value of filter.
/// * [height] updates the `inputHeight` value of filter.
///
/// See also:
///
///  * [CIHistogramDisplayFilter](https://developer.apple.com/documentation/coreimage/cihistogramdisplay), which
///    defines the exact information for filter.
class CIHistogramDisplayFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _lowLimit;
  final NumberParameter _highLimit;
  final NumberParameter _height;

  /// Create a [CIHistogramDisplayFilterConfiguration] with default values.
  CIHistogramDisplayFilterConfiguration()
    : _lowLimit = SliderNSNumberParameter(
        'inputLowLimit',
        'Low Limit',
        0,
        min: 0,
        max: 1,
      ),
      _highLimit = SliderNSNumberParameter(
        'inputHighLimit',
        'High Limit',
        1,
        min: 0,
        max: 1,
      ),
      _height = SliderNSNumberParameter(
        'inputHeight',
        'Height',
        100,
        min: 1,
        max: 200,
      ),
      super('CIHistogramDisplayFilter');

  /// The lowLimit.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set lowLimit(double value) {
    _lowLimit.value = value;
  }

  /// The highLimit.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set highLimit(double value) {
    _highLimit.value = value;
  }

  /// The height.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `1.0` to `200.0`.
  set height(double value) {
    _height.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.reduction,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _lowLimit,
    _highLimit,
    _height,
  ];
}
