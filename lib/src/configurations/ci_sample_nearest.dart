part of '../../flutter_core_image_filters.dart';

class CISampleNearestConfiguration extends CIFilterConfiguration {
  CISampleNearestConfiguration() : super('CISampleNearest');

  @override
  Iterable<CICategory> get categories => {
    CICategory.stylize,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [];
}
