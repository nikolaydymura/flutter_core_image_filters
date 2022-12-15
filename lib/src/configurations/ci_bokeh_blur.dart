part of flutter_core_image_filters;

class CIBokehBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _softness;
  final NumberParameter _ringSize;
  final NumberParameter _radius;
  final NumberParameter _ringAmount;

  CIBokehBlurConfiguration()
      : _softness = SliderNSNumberParameter(
          'inputSoftness',
          'Softness',
          1,
          min: 0,
          max: 10,
        ),
        _ringSize = SliderNSNumberParameter(
          'inputRingSize',
          'Ring Size',
          0.1,
          min: 0,
          max: 0.2,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          20,
          min: 0,
          max: 500,
        ),
        _ringAmount = SliderNSNumberParameter(
          'inputRingAmount',
          'Ring Amount',
          0,
          min: 0,
          max: 1,
        ),
        super('CIBokehBlur');

  set softness(double value) {
    _softness.value = value;
  }

  set ringSize(double value) {
    _ringSize.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set ringAmount(double value) {
    _ringAmount.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_softness, _ringSize, _radius, _ringAmount];
}
