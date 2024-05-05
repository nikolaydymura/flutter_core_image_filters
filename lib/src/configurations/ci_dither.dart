part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDither filter.
class CIDitherConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIDitherConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.1,
          min: 0,
          max: 5,
        ),
        super('CIDither');

  /// Set the intensity
  ///
  /// Values are clamped to the range [0, 5]. The default value is `0.1`
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
