part of '../../flutter_core_image_filters.dart';

class CIStretchCropConfiguration extends CIFilterConfiguration {
  final NumberParameter _centerStretchAmount;
  final NumberParameter _cropAmount;
  final PointParameter _size;

  CIStretchCropConfiguration()
      : _centerStretchAmount = SliderNSNumberParameter(
          'inputCenterStretchAmount',
          'Center Stretch Amount',
          0.25,
          min: 0,
          max: 1,
        ),
        _cropAmount = SliderNSNumberParameter(
          'inputCropAmount',
          'Crop Amount',
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
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_centerStretchAmount, _cropAmount, _size];
}
