part of flutter_core_image_filters;

class CIStraightenFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;

  CIStraightenFilterConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          3.141592653589793,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CIStraightenFilter');

  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_angle];
}
