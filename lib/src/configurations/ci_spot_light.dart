part of flutter_core_image_filters;

class CISpotLightConfiguration extends CIFilterConfiguration {
  final VectorParameter _lightPointsAt;
  final ColorParameter _color;
  final NumberParameter _concentration;
  final NumberParameter _brightness;
  final VectorParameter _lightPosition;

  CISpotLightConfiguration()
      : _lightPointsAt = CIVectorParameter(
          'inputLightPointsAt',
          'LightPointsAt',
          const [200, 200, 0],
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        _concentration = SliderNSNumberParameter(
          'inputConcentration',
          'Concentration',
          0.1,
          min: 0.001,
          max: 1.5,
        ),
        _brightness = SliderNSNumberParameter(
          'inputBrightness',
          'Brightness',
          3,
          min: 0,
          max: 10,
        ),
        _lightPosition = CIVectorParameter(
          'inputLightPosition',
          'LightPosition',
          [400, 600, 150],
        ),
        super('CISpotColor');

  set lightPointsAt(List<double> value) {
    _lightPointsAt.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set concentration(double value) {
    _concentration.value = value;
  }

  set brightness(double value) {
    _brightness.value = value;
  }

  set lightPosition(List<double> value) {
    _lightPosition.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [
        _lightPointsAt,
        _color,
        _concentration,
        _brightness,
        _lightPosition,
      ];
}
