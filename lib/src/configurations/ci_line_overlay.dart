part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a line overlay filter.
///
/// * [noiseLevel] updates the `inputNRNoiseLevel` value of filter.
/// * [contrast] updates the `inputContrast` value of filter.
/// * [threshold] updates the `inputThreshold` value of filter.
/// * [edgeIntensity] updates the `inputEdgeIntensity` value of filter.
/// * [nrSharpness] updates the `inputNRSharpness` value of filter.
///
/// See also:
///
///  * [CILineOverlay](https://developer.apple.com/documentation/coreimage/cilineoverlay), which
///    defines the exact information for filter.
class CILineOverlayConfiguration extends CIFilterConfiguration {
  final NumberParameter _noiseLevel;
  final NumberParameter _contrast;
  final NumberParameter _threshold;
  final NumberParameter _edgeIntensity;

  final NumberParameter _nrSharpness;

  /// Create a [CILineOverlayConfiguration] with default values.
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

  /// The noise level of the image, used with camera data, that's removed before tracing the edges of the image.
  ///
  /// Defaults to `0.07000000000000001`.
  ///
  /// Range: `0.0` to `0.1`.
  set noiseLevel(double value) {
    _noiseLevel.value = value;
  }

  /// The amount of antialiasing to use on the edges produced by this filter.
  ///
  /// Defaults to `50.0`.
  ///
  /// Range: `0.25` to `200.0`.
  set contrast(double value) {
    _contrast.value = value;
  }

  /// A value that determines edge visibility.
  ///
  /// Defaults to `0.1`.
  ///
  /// Range: `0.0` to `1.0`.
  set threshold(double value) {
    _threshold.value = value;
  }

  /// The accentuation factor of the Sobel gradient information when tracing the edges of the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set edgeIntensity(double value) {
    _edgeIntensity.value = value;
  }

  /// The amount of sharpening done when removing noise in the image before tracing the edges of the image.
  ///
  /// Defaults to `0.71`.
  ///
  /// Range: `0.0` to `2.0`.
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
  List<ConfigurationParameter> get parameters => [
    _noiseLevel,
    _contrast,
    _threshold,
    _edgeIntensity,
    _nrSharpness,
  ];
}
