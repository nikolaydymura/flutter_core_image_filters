part of flutter_core_image_filters;

class CIPageCurlWithShadowTransitionConfiguration extends CIFilterConfiguration
    with BacksideImageMixin, TargetImageMixin {
  final RectParameter _extent;
  final RectParameter _shadowExtent;
  final NumberParameter _time;
  final NumberParameter _shadowAmount;
  final NumberParameter _shadowSize;
  final NumberParameter _angle;
  final NumberParameter _radius;

  CIPageCurlWithShadowTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 0, 0),
        ),
        _shadowExtent = CGRectParameter(
          'inputShadowExtent',
          'Shadow Extent',
          const Rect.fromLTWH(0, 0, 0, 0),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _shadowAmount = SliderNSNumberParameter(
          'inputShadowAmount',
          'Shadow Amount',
          0.7,
          min: 0,
          max: 1,
        ),
        _shadowSize = SliderNSNumberParameter(
          'inputShadowSize',
          'Shadow Size',
          0.5,
          min: 0,
          max: 1,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 0.01,
          max: 400,
        ),
        super('CIPageCurlWithShadowTransition');

  set extent(Rect value) {
    _extent.value = value;
  }

  set shadowExtent(Rect value) {
    _shadowExtent.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set shadowAmount(double value) {
    _shadowAmount.value = value;
  }

  set shadowSize(double value) {
    _shadowSize.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _extent,
        _shadowExtent,
        _shadowSize,
        _time,
        _shadowAmount,
        _angle,
        _radius,
        _backsideImage,
        _targetImage
      ];
}
