part of '../../flutter_core_image_filters.dart';

class CIPerspectiveRotateConfiguration extends CIFilterConfiguration {
  final NumberParameter _focalLength;
  final NumberParameter _roll;
  final NumberParameter _pitch;
  final NumberParameter _yaw;

  CIPerspectiveRotateConfiguration()
      : _focalLength = NSNumberParameter(
          'inputFocalLength',
          'Focal Length',
          28,
        ),
        _roll = NSNumberParameter(
          'inputRoll',
          'Roll',
          0,
        ),
        _pitch = NSNumberParameter(
          'inputPitch',
          'Pitch',
          0,
        ),
        _yaw = NSNumberParameter(
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
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_focalLength, _roll, _pitch, _yaw];
}
