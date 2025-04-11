part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a stretch crop filter.
///
/// * [centerStretchAmount] updates the `inputCenterStretchAmount` value of filter.
/// * [cropAmount] updates the `inputCropAmount` value of filter.
/// * [size] updates the `inputSize` value of filter.
///
/// See also:
///
///  * [CIStretchCrop](https://developer.apple.com/documentation/coreimage/cistretchcrop), which
///    defines the exact information for filter.
class CIStretchCropConfiguration extends CIFilterConfiguration {
  final NumberParameter _centerStretchAmount;
  final NumberParameter _cropAmount;
  final PointParameter _size;

  /// Create a [CIStretchCropConfiguration] with default values.
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

  /// The centerStretchAmount.
  ///
  /// Defaults to `0.25`.
  ///
  /// Range: `0.0` to `1.0`.
  set centerStretchAmount(double value) {
    _centerStretchAmount.value = value;
  }

  /// The cropAmount.
  ///
  /// Defaults to `0.25`.
  ///
  /// Range: `0.0` to `1.0`.
  set cropAmount(double value) {
    _cropAmount.value = value;
  }

  /// The size.
  ///
  /// Defaults to `Point(1280.0, 720.0)`.
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
  List<ConfigurationParameter> get parameters => [
    _centerStretchAmount,
    _cropAmount,
    _size,
  ];
}
