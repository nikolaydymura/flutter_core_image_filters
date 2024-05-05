part of '../../flutter_core_image_filters.dart';

class CIMorphologyMaximumConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIMorphologyMaximumConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          0,
          min: 0,
          max: 50,
        ),
        super('CIMorphologyMaximum');

  set radius(double value) {
    _radius.value = value;
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
  List<ConfigurationParameter> get parameters => [_radius];
}
