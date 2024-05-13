part of '../../flutter_core_image_filters.dart';

/// TThe properties you use to configure a document enhancer filter.
///
/// * [amount] updates the `inputAmount` value of filter.
///
/// See also:
///
///  * [CIDocumentEnhancer](https://developer.apple.com/documentation/coreimage/cidocumentenhancer), which
///    defines the exact information for filter.
class CIDocumentEnhancerConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  /// Create a [CIDocumentEnhancerConfiguration] with default values.
  CIDocumentEnhancerConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          1,
          min: 0,
          max: 10,
        ),
        super('CIDocumentEnhancer');

  /// The amount of enhancement.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `10.0`.
  set amount(double value) {
    _amount.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
