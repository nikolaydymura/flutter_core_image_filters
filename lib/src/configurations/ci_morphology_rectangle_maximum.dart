part of flutter_core_image_filters;

class CIMorphologyRectangleMaximumConfiguration extends CIFilterConfiguration {
  final NumberParameter _height;
  final NumberParameter _width;

  CIMorphologyRectangleMaximumConfiguration()
      : _height = SliderNSNumberParameter(
          'inputHeight',
          'Height',
          5,
          min: 1,
          max: 49,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          5,
          min: 1,
          max: 49,
        ),
        super('CIMorphologyRectangleMaximum');

  set height(double value) {
    _height.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_height, _width];
}
