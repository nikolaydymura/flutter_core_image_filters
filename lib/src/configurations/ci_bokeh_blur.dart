part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a bokeh blur filter.
///
/// * [softness] updates the `inputSoftness` value of filter.
/// * [ringSize] updates the `inputRingSize` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [ringAmount] updates the `inputRingAmount` value of filter.
///
/// See also:
///
///  * [CIBokehBlur](https://developer.apple.com/documentation/coreimage/cibokehblur), which
///    defines the exact information for filter.
class CIBokehBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _softness;
  final NumberParameter _ringSize;
  final NumberParameter _radius;
  final NumberParameter _ringAmount;

  /// Create a [CIBokehBlurConfiguration] with default values.
  CIBokehBlurConfiguration()
      : _softness = SliderNSNumberParameter(
          'inputSoftness',
          'Softness',
          1,
          min: 0,
          max: 10,
        ),
        _ringSize = SliderNSNumberParameter(
          'inputRingSize',
          'Ring Size',
          0.1,
          min: 0,
          max: 0.2,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          20,
          min: 0,
          max: 500,
        ),
        _ringAmount = SliderNSNumberParameter(
          'inputRingAmount',
          'Ring Amount',
          0,
          min: 0,
          max: 1,
        ),
        super('CIBokehBlur');

  /// The softness of the bokeh effect.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `10.0`.
  set softness(double value) {
    _softness.value = value;
  }

  /// The radius of the extra emphasis at the ring of the bokeh.
  ///
  /// Defaults to `0.1`.
  ///
  /// This value ranges from `0.0` to`0.2`.
  set ringSize(double value) {
    _ringSize.value = value;
  }

  /// The radius of the blur, in pixels.
  ///
  /// Defaults to `20.0`.
  ///
  /// This value ranges from `0.0` to `500.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The amount of extra emphasis at the ring of the bokeh.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set ringAmount(double value) {
    _ringAmount.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_softness, _ringSize, _radius, _ringAmount];
}
