part of flutter_core_image_filters;

class CIFalseColorConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;
  final NumberParameter _eV;

  CIFalseColorConfiguration()
      : _color = CIColorParameter(
          'inputColor0',
          'Color0',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        _eV = SliderNSNumberParameter(
          'inputEV',
          'EV',
          0,
          min: -10,
          max: 10,
        ),
        super('CIFalseColor');

  set color(Color value) {
    _color.value = value;
  }

  set eV(double value) {
    _eV.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_color, _eV];
}