part of flutter_core_image_filters;

class CIColorThresholdConfiguration extends CIFilterConfiguration {
  final NumberParameter _threshold;

  CIColorThresholdConfiguration()
      : _threshold = SliderNSNumberParameter(
          'inputThreshold',
          'Threshold',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIColorThreshold');

  set threshold(double value) {
    _threshold.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_threshold];
}
