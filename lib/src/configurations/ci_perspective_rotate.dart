part of flutter_core_image_filters;

class CIPerspectiveRotateConfiguration extends CIFilterConfiguration {
  final NumberParameter _focalLength;
  final NumberParameter _roll;
  final NumberParameter _pitch;
  final NumberParameter _yaw;

  CIPerspectiveRotateConfiguration()
      : _focalLength = SliderNSNumberParameter(
          'inputFocalLength',
          'FocalLength',
          20,
        ),
        _roll = SliderNSNumberParameter(
          'inputRoll',
          'Roll',
          0,
        ),
        _pitch = SliderNSNumberParameter(
          'inputPitch',
          'Pitch',
          0,
        ),
        _yaw = SliderNSNumberParameter(
          'inputYaw',
          'Yaw',
          0,
        ),
        super('CIPerspectiveRotate');

  set focalLength(double value) {
    _focalLength.value = value;
  }

  set roll(double value) {
    _roll.value = value;
  }

  set pitch(double value) {
    _pitch.value = value;
  }

  set yaw(double value) {
    _yaw.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_focalLength, _roll, _pitch, _yaw];
}
