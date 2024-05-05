part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBokehBlur filter.
class CIBokehBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _softness;
  final NumberParameter _ringSize;
  final NumberParameter _radius;
  final NumberParameter _ringAmount;

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

  /// The softness of the bokeh.
  ///
  /// This value ranges from 0.0 to 10.0.
  set softness(double value) {
    _softness.value = value;
  }

  /// The size of the bokeh rings.
  ///
  /// This value ranges from 0.0 to 0.2.
  set ringSize(double value) {
    _ringSize.value = value;
  }

  /// The radius of the bokeh.
  ///
  /// This value ranges from 0.0 to 500.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The amount of bokeh rings.
  ///
  /// This value ranges from 0.0 to 1.0.
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
