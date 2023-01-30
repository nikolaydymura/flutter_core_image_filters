part of flutter_core_image_filters;

class CICropConfiguration extends CIFilterConfiguration {
  final RectParameter _rectangle;

  CICropConfiguration()
      : _rectangle = CGRectParameter(
          'inputRectangle',
          'Rectangle',
          const Rect.fromLTWH(
            -8.98847e+307,
            -8.98847e+307,
            1.79769e+308,
            1.79769e+308,
          ),
        ),
        super('CICrop');

  set rectangle(Rect value) {
    _rectangle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_rectangle];
}
