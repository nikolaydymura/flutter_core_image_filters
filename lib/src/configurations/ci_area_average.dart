part of flutter_core_image_filters;

class CIAreaAverageConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  CIAreaAverageConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        super('CIAreaAverage');

  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
