part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorPosterize filter.
class CIColorPosterizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _levels;

  CIColorPosterizeConfiguration()
      : _levels = SliderNSNumberParameter(
          'inputLevels',
          'Levels',
          6,
          min: 1,
          max: 30,
        ),
        super('CIColorPosterize');

  /// The number of color levels to use.
  ///
  /// This value ranges from 1 to 30.
  set levels(double value) {
    _levels.value = value;
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
  List<ConfigurationParameter> get parameters => [_levels];
}
