part of flutter_core_image_filters;

class CIMorphologyRectangleMaximumConfiguration extends CIFilterConfiguration {
  final NumberParameter _height;
  final NumberParameter _width;

  CIMorphologyRectangleMaximumConfiguration()
      : _height = SliderNSIntegerParameter(
          'inputHeight',
          'Height',
          5,
          min: 1,
          max: 49,
        ),
        _width = SliderNSIntegerParameter(
          'inputWidth',
          'Width',
          5,
          min: 1,
          max: 49,
        ),
        super('CIMorphologyRectangleMaximum');

  set height(int value) {
    _height.value = value;
  }

  set width(int value) {
    _width.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_height, _width];
}
