part of flutter_core_image_filters;

class CIClampConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  CIClampConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        super('CIClamp');

  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
