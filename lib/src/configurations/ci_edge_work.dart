part of flutter_core_image_filters;

class CIEdgeWorkConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIEdgeWorkConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          3,
          min: 0,
          max: 20,
        ),
        super('CIEdgeWork');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
