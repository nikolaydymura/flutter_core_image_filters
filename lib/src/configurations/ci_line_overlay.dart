part of '../../flutter_core_image_filters.dart';

class CILineOverlayConfiguration extends CIFilterConfiguration {
  final NumberParameter _noiseLevel;
  final NumberParameter _contrast;
  final NumberParameter _threshold;
  final NumberParameter _edgeIntensity;

  final NumberParameter _nrSharpness;

  CILineOverlayConfiguration()
      : _noiseLevel = SliderNSNumberParameter(
          'inputNRNoiseLevel',
          'NR Noise Level',
          0.07000000000000001,
          min: 0,
          max: 0.1,
        ),
        _contrast = SliderNSNumberParameter(
          'inputContrast',
          'Contrast',
          50,
          min: 0.25,
          max: 200,
        ),
        _threshold = SliderNSNumberParameter(
          'inputThreshold',
          'Threshold',
          0.1,
          min: 0,
          max: 1,
        ),
        _edgeIntensity = SliderNSNumberParameter(
          'inputEdgeIntensity',
          'Edge Intensity',
          1,
          min: 0,
          max: 200,
        ),
        _nrSharpness = SliderNSNumberParameter(
          'inputNRSharpness',
          'NR Sharpness',
          0.71,
          min: 0,
          max: 2,
        ),
        super('CILineOverlay');

  set noiseLevel(double value) {
    _noiseLevel.value = value;
  }

  set contrast(double value) {
    _contrast.value = value;
  }

  set threshold(double value) {
    _threshold.value = value;
  }

  set edgeIntensity(double value) {
    _edgeIntensity.value = value;
  }

  set nrSharpness(double value) {
    _nrSharpness.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.builtIn,
        CICategory.stillImage,
        CICategory.video,
        CICategory.stylize,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_noiseLevel, _contrast, _threshold, _edgeIntensity, _nrSharpness];
}
