part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a highlight-shadow adjust filter.
///
/// * [highlightAmount] updates the `inputHighlightAmount` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [shadowAmount] updates the `inputShadowAmount` value of filter.
///
/// See also:
///
///  * [CIHighlightShadowAdjust](https://developer.apple.com/documentation/coreimage/cihighlightshadowadjust), which
///    defines the exact information for filter.
class CIHighlightShadowAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _highlightAmount;
  final NumberParameter _radius;
  final NumberParameter _shadowAmount;

  /// Create a [CIHighlightShadowAdjustConfiguration] with default values.
  CIHighlightShadowAdjustConfiguration()
      : _highlightAmount = SliderNSNumberParameter(
          'inputHighlightAmount',
          'Highlight Amount',
          1,
          min: 0.0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          0,
          min: 0,
          max: 10,
        ),
        _shadowAmount = SliderNSNumberParameter(
          'inputShadowAmount',
          'Shadow Amount',
          0,
          min: -1,
          max: 1,
        ),
        super('CIHighlightShadowAdjust');

  /// The amount of adjustment to the highlights in the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set highlightAmount(double value) {
    _highlightAmount.value = value;
  }

  /// The shadow highlight radius.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `10.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The amount of adjustment to the shadows in the image.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-1.0` to `1.0`.
  set shadowAmount(double value) {
    _shadowAmount.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_highlightAmount, _radius, _shadowAmount];
}
