part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a perspective rotate filter.
///
/// * [focalLength] updates the `inputFocalLength` value of filter.
/// * [roll] updates the `inputRoll` value of filter.
/// * [pitch] updates the `inputPitch` value of filter.
/// * [yaw] updates the `inputYaw` value of filter.
///
/// See also:
///
///  * [CIPerspectiveRotate](https://developer.apple.com/documentation/coreimage/ciperspectiverotate), which
///    defines the exact information for filter.
class CIPerspectiveRotateConfiguration extends CIFilterConfiguration {
  final NumberParameter _focalLength;
  final NumberParameter _roll;
  final NumberParameter _pitch;
  final NumberParameter _yaw;

  /// Create a [CIPerspectiveRotateConfiguration] with default values.
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

  /// The focalLength.
  ///
  /// Defaults to `28`.
  set focalLength(double value) {
    _focalLength.value = value;
  }

  /// The roll.
  ///
  /// Defaults to `0`.
  set roll(double value) {
    _roll.value = value;
  }

  /// The pitch.
  ///
  /// Defaults to `0`.
  set pitch(double value) {
    _pitch.value = value;
  }

  /// The yaw.
  ///
  /// Defaults to `0`.
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
