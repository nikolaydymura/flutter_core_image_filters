part of flutter_core_image_filters;

class CIRippleTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin, ShadingImageMixin {
  final RectParameter _extent;
  final NumberParameter _time;
  final NumberParameter _scale;
  final NumberParameter _width;
  final PointParameter _center;

  CIRippleTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(
            0,
            0,
            300,
            300,
          ),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          50,
          min: -50,
          max: 50,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          100,
          min: 1,
          max: 300,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIRippleTransition');

  set extent(Rect value) {
    _extent.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set scale(double value) {
    _scale.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
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
        _time,
        _scale,
        _width,
        _center,
        _shadingImage,
        _targetImage,
      ];
}
