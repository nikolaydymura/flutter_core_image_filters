part of flutter_core_image_filters;

class CIExposureAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _eV;

  CIExposureAdjustConfiguration()
      : _eV = SliderNSNumberParameter(
          'inputEV',
          'EV',
          0,
          min: -10,
          max: 10,
        ),
        super('CIExposureAdjust');

  set eV(double value) {
    _eV.value = value;
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
        CICategory.xmpSerializable,
      };

  @override
  List<ConfigurationParameter> get parameters => [_eV];
}
