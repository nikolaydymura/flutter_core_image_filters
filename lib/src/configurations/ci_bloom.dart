part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBloom filter.
class CIBloomConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  CIBloomConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 100,
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIBloom');

  /// The radius of the bloom.
  ///
  /// This value ranges from 0.0 to 100.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The intensity of the bloom.
  ///
  /// This value ranges from 0.0 to 1.0.
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
