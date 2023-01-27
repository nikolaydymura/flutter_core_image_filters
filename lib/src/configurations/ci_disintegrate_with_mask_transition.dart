part of flutter_core_image_filters;

class CIDisintegrateWithMaskTransitionConfiguration
    extends CIFilterConfiguration with TargetImageMixin {
  final NumberParameter _time;
  final PointParameter _shadowOffset;
  final NumberParameter _shadowDensity;
  final NumberParameter _shadowRadius;

  CIDisintegrateWithMaskTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _shadowOffset = CGPositionParameter(
          'inputShadowOffset',
          'ShadowOffset',
          const Point(0, -10),
        ),
        _shadowDensity = SliderNSNumberParameter(
          'inputShadowDensity',
          'ShadowDensity',
          0.65,
          min: 0,
          max: 1,
        ),
        _shadowRadius = SliderNSNumberParameter(
          'inputShadowRadius',
          'ShadowRadius',
          8,
          min: 0,
          max: 50,
        ),
        super('CIDisintegrateWithMaskTransition');

  set time(double value) {
    _time.value = value;
  }

  set shadowOffset(Point<double> value) {
    _shadowOffset.value = value;
  }

  set shadowDensity(double value) {
    _shadowDensity.value = value;
  }

  set shadowRadius(double value) {
    _shadowRadius.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_time, _shadowOffset, _shadowDensity, _shadowRadius, _targetImage];
}
