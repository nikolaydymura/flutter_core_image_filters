part of flutter_core_image_filters;

class CIExposureAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _eV;

  CIExposureAdjustConfiguration()
      : _eV = SliderNSNumberParameter(
          'inputEV',
          'EV',
          0,
          min: -10,
          max: 10,
        ),
        super('CIExposureAdjust');

  set eV(double value) {
    _eV.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_eV];
}
