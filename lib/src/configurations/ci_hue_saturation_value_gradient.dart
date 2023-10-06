part of flutter_core_image_filters;

class CIHueSaturationValueGradientConfiguration extends CIFilterConfiguration
    with ColorSpaceMixin {
  final NumberParameter _dither;
  final NumberParameter _softness;
  final NumberParameter _radius;
  final NumberParameter _value;

  CIHueSaturationValueGradientConfiguration()
      : _dither = SliderNSNumberParameter(
          'inputDither',
          'Dither',
          1,
          min: 0,
          max: 3,
        ),
        _softness = SliderNSNumberParameter(
          'inputSoftness',
          'Softness',
          1,
          min: 0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 800,
        ),
        _value = SliderNSNumberParameter(
          'inputValue',
          'Value',
          1,
          min: 0,
          max: 1,
        ),
        super('CIHueSaturationValueGradient');

  @override
  bool get hasInputImage => false;

  set dither(double value) {
    _dither.value = value;
  }

  set softness(double value) {
    _softness.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set value(double value) {
    _value.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.gradient,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _dither, _softness, _radius, _value];
}
