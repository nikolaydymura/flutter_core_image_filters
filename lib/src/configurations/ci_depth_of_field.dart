part of flutter_core_image_filters;

class CIDepthOfFieldConfiguration extends CIFilterConfiguration {
  final PointParameter _point1;
  final NumberParameter _unsharpMaskRadius;
  final NumberParameter _saturation;
  final NumberParameter _radius;
  final NumberParameter _unsharpMaskIntensity;
  final PointParameter _point0;

  CIDepthOfFieldConfiguration()
      : _point1 = CGPositionParameter(
          'inputPoint1',
          'Point 1',
          const Point(300.0, 300.0),
        ),
        _unsharpMaskRadius = SliderNSNumberParameter(
          'inputUnsharpMaskRadius',
          'Unsharp Mask Radius',
          2.5,
          min: 0,
          max: 10,
        ),
        _saturation = SliderNSNumberParameter(
          'inputSaturation',
          'Saturation',
          1.5,
          min: 0,
          max: 10,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          6,
          min: 0,
          max: 30,
        ),
        _unsharpMaskIntensity = SliderNSNumberParameter(
          'inputUnsharpMaskIntensity',
          'Unsharp Mask Intensity',
          0.5,
          min: 0,
          max: 10,
        ),
        _point0 = CGPositionParameter(
          'inputPoint0',
          'Point 0',
          const Point(0, 300.0),
        ),
        super('CIDepthOfField');

  set point1(Point<double> value) {
    _point1.value = value;
  }

  set unsharpMaskRadius(double value) {
    _unsharpMaskRadius.value = value;
  }

  set saturation(double value) {
    _saturation.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set unsharpMaskIntensity(double value) {
    _unsharpMaskIntensity.value = value;
  }

  set point0(Point<double> value) {
    _point0.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _point1,
        _unsharpMaskRadius,
        _saturation,
        _radius,
        _unsharpMaskIntensity,
        _point0
      ];
}
