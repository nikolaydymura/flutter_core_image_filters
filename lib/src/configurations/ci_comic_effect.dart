part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIComicEffect filter.
class CIComicEffectConfiguration extends CIFilterConfiguration {
  CIComicEffectConfiguration() : super('CIComicEffect');

  @override
  Iterable<CICategory> get categories => {
    CICategory.stylize,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [];
}
