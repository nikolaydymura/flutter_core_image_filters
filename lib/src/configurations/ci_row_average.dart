part of flutter_core_image_filters;

class CIRowAverageConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;

  CIRowAverageConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        super('CIRowAverage');

  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.reduction,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
