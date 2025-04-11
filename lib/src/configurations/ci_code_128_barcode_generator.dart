part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a Code 128 barcode generator filter.
///
/// * [quietSpace] updates the `inputQuietSpace` value of filter.
/// * [barcodeHeight] updates the `inputBarcodeHeight` value of filter.
///
/// See also:
///
///  * [CICode128BarcodeGenerator](https://developer.apple.com/documentation/coreimage/cicode128barcodegenerator), which
///    defines the exact information for filter.
class CICode128BarcodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final NumberParameter _quietSpace;
  final NumberParameter _barcodeHeight;

  /// Create a [CICode128BarcodeGeneratorConfiguration] with default values.
  CICode128BarcodeGeneratorConfiguration()
    : _quietSpace = SliderNSIntegerParameter(
        'inputQuietSpace',
        'Quiet Space',
        10,
        min: 0,
        max: 100,
      ),
      _barcodeHeight = SliderNSIntegerParameter(
        'inputBarcodeHeight',
        'Barcode Height',
        32,
        min: 1,
        max: 500,
      ),
      super('CICode128BarcodeGenerator');

  /// The number of empty white pixels that should surround the barcode.
  ///
  ///  Defaults to `10.0`.
  ///
  /// This value ranges from `0.0` to `100.0`.
  set quietSpace(int value) {
    _quietSpace.value = value;
  }

  /// The height, in pixels, of the generated barcode.
  ///
  /// Defaults to `32.0`.
  ///
  /// This value ranges from `1.0` to `500.0`.
  set barcodeHeight(int value) {
    _barcodeHeight.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.generator,
    CICategory.stillImage,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _quietSpace,
    _barcodeHeight,
    _message,
  ];

  @override
  bool get hasInputImage => false;
}
