part of flutter_core_image_filters;

class CIMonochromeConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;
  final ColorParameter _color;

  CIMonochromeConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 1,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(153, 115, 76, 1.0),
        ),
        super('CIColorMonochrome');

  set intensity(double value) {
    _intensity.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _color];
}
