part of flutter_core_image_filters;

class CILabDeltaEConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _aspectRatio;

  CILabDeltaEConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0,
          min: 0.05,
          max: 1.5,
        ),
        _aspectRatio = SliderNSNumberParameter(
          'inputAspectRatio',
          'AspectRatio',
          0,
          min: 0.5,
          max: 2,
        ),
        super('CILabDeltaE');

  set scale(double value) {
    _scale.value = value;
  }

  set aspectRatio(double value) {
    _aspectRatio.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scale, _aspectRatio];
}
