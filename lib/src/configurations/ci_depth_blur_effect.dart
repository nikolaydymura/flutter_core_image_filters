part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDepthBlurEffect filter.
class CIDepthBlurEffectConfiguration extends CIFilterConfiguration {
  final PointParameter _chinPositions;
  final PointParameter _leftEyePositions;
  final StringParameter _shape;
  final NumberParameter _scaleFactor;
  final PointParameter _rightEyePositions;
  final NumberParameter _lumaNoiseScale;
  final PointParameter _nosePositions;
  final NumberParameter _aperture;
  final RectParameter _focusRect;

  CIDepthBlurEffectConfiguration()
      : _chinPositions = CGPositionParameter(
          'inputChinPositions',
          'ChinPositions',
          const Point(-1.0, -1.0),
        ),
        _leftEyePositions = CGPositionParameter(
          'inputLeftEyePositions',
          'LeftEyePositions',
          const Point(-1.0, -1.0),
        ),
        _shape = NSStringParameter(
          'inputShape',
          'Shape',
          '',
        ),
        _scaleFactor = SliderNSNumberParameter(
          'inputScaleFactor',
          'ScaleFactor',
          1,
          min: 0,
          max: 1,
        ),
        _rightEyePositions = CGPositionParameter(
          'inputRightEyePositions',
          'RightEyePositions',
          const Point(-1.0, -1.0),
        ),
        _lumaNoiseScale = SliderNSNumberParameter(
          'inputLumaNoiseScale',
          'LumaNoiseScale',
          0,
          min: 0,
          max: 0.1,
        ),
        _nosePositions = CGPositionParameter(
          'inputNosePositions',
          'NosePositions',
          const Point(-1.0, -1.0),
        ),
        _aperture = SliderNSNumberParameter(
          'inputAperture',
          'Aperture',
          0,
          min: 0,
          max: 22,
        ),
        _focusRect = CGRectParameter(
          'inputFocusRect',
          'FocusRect',
          const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0),
        ),
        super('CIDepthBlurEffect');

  /// The chin positions.
  ///
  /// Defaults to (-1.0, -1.0).
  set chinPositions(Point<double> value) {
    _chinPositions.value = value;
  }

  /// The left eye positions.
  ///
  /// Defaults to (-1.0, -1.0).
  set leftEyePositions(Point<double> value) {
    _leftEyePositions.value = value;
  }

  /// The shape.
  set shape(String value) {
    _shape.value = value;
  }

  /// The scale factor.
  ///
  /// Ranges from 0 to 1.
  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  /// The right eye positions.
  ///
  /// Defaults to (-1.0, -1.0).
  set rightEyePositions(Point<double> value) {
    _rightEyePositions.value = value;
  }

  /// The luma noise scale.
  ///
  /// Ranges from 0 to 0.1.
  set lumaNoiseScale(double value) {
    _lumaNoiseScale.value = value;
  }

  /// The nose positions.
  ///
  /// Defaults to (-1.0, -1.0).
  set nosePositions(Point<double> value) {
    _nosePositions.value = value;
  }

  /// The aperture.
  ///
  /// Ranges from 0 to 22.
  set aperture(double value) {
    _aperture.value = value;
  }

  /// The focus rect.
  ///
  /// Defaults to Rect.fromLTWH(0.0, 0.0, 0.0, 0.0).
  set focusRect(Rect value) {
    _focusRect.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _chinPositions,
        _leftEyePositions,
        _shape,
        _scaleFactor,
        _rightEyePositions,
        _lumaNoiseScale,
        _nosePositions,
        _aperture,
        _focusRect,
      ];
}
