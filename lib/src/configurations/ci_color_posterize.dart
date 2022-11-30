part of flutter_core_image_filters;

class CIColorPosterizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _levels;

  CIColorPosterizeConfiguration()
      : _levels = SliderNSNumberParameter(
          'inputLevels',
          'Levels',
          6,
          min: 2,
          max: 30,
        ),
        super('CIColorPosterize');

  set levels(double value) {
    _levels.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_levels];
}
