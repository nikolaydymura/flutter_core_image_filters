part of flutter_core_image_filters;

class CIPageCurlTransitionConfiguration extends CIFilterConfiguration
    with ShadingImageMixin, TargetImageMixin, BacksideImageMixin {
  final RectParameter _extent;
  final NumberParameter _time;
  final NumberParameter _radius;
  final NumberParameter _angle;

  CIPageCurlTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 300, 300),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 0.01,
          max: 400,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIPageCurlTransition');

  set extent(Rect value) {
    _extent.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [
        _extent,
        _time,
        _radius,
        _angle,
        _shadingImage,
        _targetImage,
        _backsideImage
      ];
}
