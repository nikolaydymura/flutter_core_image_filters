part of flutter_core_image_filters;

class CISepiaToneConfiguration extends CIFilterConfiguration
    with ShadingImageMixin {
  final NumberParameter _intensity;

  CISepiaToneConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 1,
        ),
        super('CISepiaTone');

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
        CICategory.xmpSerializable
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _shadingImage];
}
