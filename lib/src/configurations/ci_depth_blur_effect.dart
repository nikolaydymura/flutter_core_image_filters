part of flutter_core_image_filters;

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

  set chinPositions(Point<double> value) {
    _chinPositions.value = value;
  }

  set leftEyePositions(Point<double> value) {
    _leftEyePositions.value = value;
  }

  set shape(String value) {
    _shape.value = value;
  }

  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  set rightEyePositions(Point<double> value) {
    _rightEyePositions.value = value;
  }

  set lumaNoiseScale(double value) {
    _lumaNoiseScale.value = value;
  }

  set nosePositions(Point<double> value) {
    _nosePositions.value = value;
  }

  set aperture(double value) {
    _aperture.value = value;
  }

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
