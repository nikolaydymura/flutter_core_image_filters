part of flutter_core_image_filters;

class CIMaskedVariableBlurConfiguration extends CIFilterConfiguration
    with MaskImageMixin {
  final NumberParameter _radius;

  @override
  String get _maskImageInputKey => 'inputMask';

  @override
  String get _maskImageInputName => 'Mask';

  CIMaskedVariableBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          5,
          min: 0,
          max: 10,
        ),
        super('CIMaskedVariableBlur');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _maskImage];
}
