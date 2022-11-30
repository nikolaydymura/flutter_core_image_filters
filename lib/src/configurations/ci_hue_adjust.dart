part of flutter_core_image_filters;

class CIHueAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;

  CIHueAdjustConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIHueAdjust');

  set angle(double value) {
    _angle.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_angle];
}
