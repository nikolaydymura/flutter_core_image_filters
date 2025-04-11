part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a noise reduction filter.
///
/// * [noiseLevel] updates the `inputNoiseLevel` value of filter.
/// * [sharpness] updates the `inputSharpness` value of filter.
///
/// See also:
///
///  * [CINoiseReduction](https://developer.apple.com/documentation/coreimage/cinoisereduction), which
///    defines the exact information for filter.
class CINoiseReductionConfiguration extends CIFilterConfiguration {
  final NumberParameter _noiseLevel;
  final NumberParameter _sharpness;

  /// Create a [CINoiseReductionConfiguration] with default values.
  CINoiseReductionConfiguration()
    : _noiseLevel = SliderNSNumberParameter(
        'inputNoiseLevel',
        'Noise Level',
        0.02,
        min: 0,
        max: 0.1,
      ),
      _sharpness = SliderNSNumberParameter(
        'inputSharpness',
        'Sharpness',
        0.4,
        min: 0,
        max: 2,
      ),
      super('CINoiseReduction');

  /// The amount of noise reduction.
  ///
  /// Defaults to `0.02`.
  ///
  /// Range: `0.0` to `0.1`
  set noiseLevel(double value) {
    _noiseLevel.value = value;
  }

  /// The sharpness of the final image.
  ///
  /// Defaults to `0.4`.
  ///
  /// Range: `0.0` to `2.0`.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.blur,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_noiseLevel, _sharpness];
}
