part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorCubeWithIntensity filter.
class CIColorCubeWithIntensityConfiguration extends CIFilterConfiguration
    with CubeDimensionMixin, CubeDataMixin {
  final NumberParameter _intensity;

  CIColorCubeWithIntensityConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1.0,
          min: 0.0,
          max: 1.0,
        ),
        super('CIColorCubeWithIntensityFilter');

  /// The intensity of the effect.
  ///
  /// This value ranges from 0.0 to 1.0.
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _intensity];
}
