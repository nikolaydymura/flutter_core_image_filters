part of flutter_core_image_filters;

class CIAreaMinimumAlphaConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  CIAreaMinimumAlphaConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        super('CIAreaMinimumAlpha');

  set extent(Rect value) {
    _extent.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_extent];
}
