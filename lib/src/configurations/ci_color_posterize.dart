part of flutter_core_image_filters;

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
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_levels];
}
