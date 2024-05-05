part of '../../flutter_core_image_filters.dart';

class CIGammaAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _power;

  CIGammaAdjustConfiguration()
      : _power = SliderNSNumberParameter(
          'inputPower',
          'Power',
          1,
          min: 0.25,
          max: 4,
        ),
        super('CIGammaAdjust');

  set power(double value) {
    _power.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_power];
}
