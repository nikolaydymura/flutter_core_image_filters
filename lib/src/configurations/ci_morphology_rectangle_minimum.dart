part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a morphology rectangle minimum filter.
///
/// * [height] updates the `inputHeight` value of filter.
/// * [width] updates the `inputWidth` value of filter.
///
/// See also:
///
///  * [CIMorphologyRectangleMinimum](https://developer.apple.com/documentation/coreimage/cimorphologyrectangleminimum), which
///    defines the exact information for filter.
class CIMorphologyRectangleMinimumConfiguration extends CIFilterConfiguration {
  final NumberParameter _height;
  final NumberParameter _width;

  /// Create a [CIMorphologyRectangleMinimumConfiguration] with default values.
  CIMorphologyRectangleMinimumConfiguration()
    : _height = SliderNSIntegerParameter(
        'inputHeight',
        'Height',
        5,
        min: 1,
        max: 49,
      ),
      _width = SliderNSIntegerParameter(
        'inputWidth',
        'Width',
        5,
        min: 1,
        max: 49,
      ),
      super('CIMorphologyRectangleMinimum');

  /// The height, in pixels, of the morphological structuring element.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `1.0` to `49.0`.
  set height(int value) {
    _height.value = value;
  }

  /// The width, in pixels, of the morphological structuring element.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `1.0` to `49.0`.
  set width(int value) {
    _width.value = value;
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
  List<ConfigurationParameter> get parameters => [_height, _width];
}
