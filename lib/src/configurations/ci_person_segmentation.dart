part of flutter_core_image_filters;

class CIPersonSegmentationConfiguration extends CIFilterConfiguration {
  final NumberParameter _qualityLevel;

  CIPersonSegmentationConfiguration()
      : _qualityLevel = SliderNSNumberParameter(
          'inputQualityLevel',
          'QualityLevel',
          1,
          min: 0,
          max: 2,
        ),
        super('CIPersonSegmentation');

  set qualityLevel(double value) {
    _qualityLevel.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_qualityLevel];
}
