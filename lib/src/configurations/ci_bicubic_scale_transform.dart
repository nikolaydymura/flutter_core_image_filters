part of flutter_core_image_filters;

class CIBicubicScaleTransformConfiguration extends CIFilterConfiguration {
  final NumberParameter _b;
  final NumberParameter _scale;
  final NumberParameter _c;
  final NumberParameter _aspectRatio;

  CIBicubicScaleTransformConfiguration()
      : _b = SliderNSNumberParameter(
          'inputB',
          'B',
          0,
          min: 0,
          max: 1,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          1,
          min: 0.00,
          max: 100,
        ),
        _c = SliderNSNumberParameter(
          'inputC',
          'C',
          0.75,
          min: 0,
          max: 1,
        ),
        _aspectRatio = SliderNSNumberParameter(
          'inputAspectRatio',
          'Aspect Ratio',
          1,
          min: 0,
          max: 2,
        ),
        super('CIBicubicScaleTransform');

  set b(double value) {
    _b.value = value;
  }

  set scale(double value) {
    _scale.value = value;
  }

  set c(double value) {
    _c.value = value;
  }

  set aspectRatio(double value) {
    _aspectRatio.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_b, _scale, _c, _aspectRatio];
}
