part of flutter_core_image_filters;

class CIDissolveTransitionConfiguration extends CIFilterConfiguration {
  final NumberParameter _time;

  CIDissolveTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        super('CIDissolveTransition');

  set time(double value) {
    _time.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_time];
}
