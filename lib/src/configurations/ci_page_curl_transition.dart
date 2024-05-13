part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a page curl transition filter.
///
/// * [extent] updates the `inputExtent` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CIPageCurlTransition](https://developer.apple.com/documentation/coreimage/cipagecurltransition), which
///    defines the exact information for filter.
class CIPageCurlTransitionConfiguration extends CIFilterConfiguration
    with ShadingImageMixin, TargetImageMixin, BacksideImageMixin {
  final RectParameter _extent;
  final NumberParameter _time;
  final NumberParameter _radius;
  final NumberParameter _angle;

  /// Create a [CIPageCurlTransitionConfiguration] with default values.
  CIPageCurlTransitionConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 300, 300),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 0.01,
          max: 400,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIPageCurlTransition');

  /// The extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The radius of the curl.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.01` to `400.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The angle of the curling page.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
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
        _time,
        _radius,
        _angle,
        _shadingImage,
        _targetImage,
        _backsideImage,
      ];
}
