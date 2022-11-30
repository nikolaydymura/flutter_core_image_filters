part of flutter_core_image_filters;

class CIGammaAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _power;

  CIGammaAdjustConfiguration()
      : _power = SliderNSNumberParameter(
          'inputPower',
          'Power',
          1,
          min: 0.25,
          max: 4,
        ),
        super('CIGammaAdjust');

  set power(double value) {
    _power.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_power];
}
