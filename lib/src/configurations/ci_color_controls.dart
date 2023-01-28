part of flutter_core_image_filters;

class CIColorControlsConfiguration extends CIFilterConfiguration {
  final NumberParameter _brightness;
  final NumberParameter _saturation;
  final NumberParameter _contrast;

  CIColorControlsConfiguration()
      : _brightness = SliderNSNumberParameter(
          'inputBrightness',
          'Brightness',
          0,
          min: -1,
          max: 1,
        ),
        _saturation = SliderNSNumberParameter(
          'inputSaturation',
          'Saturation',
          1,
          min: 0,
          max: 2,
        ),
        _contrast = SliderNSNumberParameter(
          'inputContrast',
          'Contrast',
          1,
          min: 0.0,
          max: 4,
        ),
        super('CIColorControls');

  set brightness(double value) {
    _brightness.value = value;
  }

  set saturation(double value) {
    _saturation.value = value;
  }

  set contrast(double value) {
    _contrast.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_brightness, _saturation, _contrast];
}
