part of '../../flutter_core_image_filters.dart';

class CIPersonSegmentationConfiguration extends CIFilterConfiguration {
  final NumberParameter _qualityLevel;

  CIPersonSegmentationConfiguration()
      : _qualityLevel = NSNumberParameter(
          'inputQualityLevel',
          'Quality Level',
          double.nan,
        ),
        super('CIPersonSegmentation');

  set qualityLevel(double value) {
    _qualityLevel.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.stylize,
      };

  @override
  List<ConfigurationParameter> get parameters => [_qualityLevel];
}
