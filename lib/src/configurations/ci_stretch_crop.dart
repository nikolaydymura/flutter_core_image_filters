part of flutter_core_image_filters;

class CIStretchCropConfiguration extends CIFilterConfiguration {
  final NumberParameter _centerStretchAmount;
  final NumberParameter _cropAmount;
  final PointParameter _size;

  CIStretchCropConfiguration()
      : _centerStretchAmount = SliderNSNumberParameter(
          'inputCenterStretchAmount',
          'CenterStretchAmount',
          0.25,
          min: 0,
          max: 1,
        ),
        _cropAmount = SliderNSNumberParameter(
          'inputCropAmount',
          'CropAmount',
          0.25,
          min: 0,
          max: 1,
        ),
        _size = CGPositionParameter(
          'inputSize',
          'Size',
          const Point(1280.0, 720.0),
        ),
        super('CIStretchCrop');
  set centerStretchAmount(double value) {
    _centerStretchAmount.value = value;
  }

  set cropAmount(double value) {
    _cropAmount.value = value;
  }

  set size(Point<double> value) {
    _size.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_centerStretchAmount, _cropAmount, _size];
}
