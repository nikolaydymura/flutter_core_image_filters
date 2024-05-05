part of '../../flutter_core_image_filters.dart';

class CIHeightFieldFromMaskConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIHeightFieldFromMaskConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 300,
        ),
        super('CIHeightFieldFromMask');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
