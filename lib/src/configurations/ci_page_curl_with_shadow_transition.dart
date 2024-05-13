part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a page-curl-with-shadow transition filter.
///
/// * [extent] updates the `inputExtent` value of filter.
/// * [shadowExtent] updates the `inputShadowExtent` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [shadowAmount] updates the `inputShadowAmount` value of filter.
/// * [shadowSize] updates the `inputShadowSize` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIPageCurlWithShadowTransition](https://developer.apple.com/documentation/coreimage/cipagecurlwithshadowtransition), which
///    defines the exact information for filter.
class CIPageCurlWithShadowTransitionConfiguration extends CIFilterConfiguration
    with BacksideImageMixin, TargetImageMixin {
  final RectParameter _extent;
  final RectParameter _shadowExtent;
  final NumberParameter _time;
  final NumberParameter _shadowAmount;
  final NumberParameter _shadowSize;
  final NumberParameter _angle;
  final NumberParameter _radius;

  /// Create a [CIPageCurlWithShadowTransitionConfiguration] with default values.
  CIPageCurlWithShadowTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 0, 0),
        ),
        _shadowExtent = CGRectParameter(
          'inputShadowExtent',
          'Shadow Extent',
          const Rect.fromLTWH(0, 0, 0, 0),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _shadowAmount = SliderNSNumberParameter(
          'inputShadowAmount',
          'Shadow Amount',
          0.7,
          min: 0,
          max: 1,
        ),
        _shadowSize = SliderNSNumberParameter(
          'inputShadowSize',
          'Shadow Size',
          0.5,
          min: 0,
          max: 1,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 0.01,
          max: 400,
        ),
        super('CIPageCurlWithShadowTransition');

  /// The extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 0, 0)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The rectagular portion of input image that casts a shadow.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 0, 0)`.
  set shadowExtent(Rect value) {
    _shadowExtent.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The strength of the shadow.
  ///
  /// Defaults to `0.7`.
  ///
  /// Range: `0.0` to `1.0`.
  set shadowAmount(double value) {
    _shadowAmount.value = value;
  }

  /// The maximum size, in pixels, of the shadow.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `1.0`.
  set shadowSize(double value) {
    _shadowSize.value = value;
  }

  /// The angle of the curling page.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  ///The radius of the curl.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.01` to `400.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _extent,
        _shadowExtent,
        _shadowSize,
        _time,
        _shadowAmount,
        _angle,
        _radius,
        _backsideImage,
        _targetImage,
      ];
}
