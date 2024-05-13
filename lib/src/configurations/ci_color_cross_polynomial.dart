part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color cross-polynomial filter.
///
/// * [redCoefficients] updates the `inputRedCoefficients` value of filter.
/// * [greenCoefficients] updates the `inputGreenCoefficients` value of filter.
/// * [blueCoefficients] updates the `inputBlueCoefficients` value of filter.
///
/// See also:
///
///  * [CIColorCrossPolynomial](https://developer.apple.com/documentation/coreimage/cicolorcrosspolynomial), which
///    defines the exact information for filter.
class CIColorCrossPolynomialConfiguration extends CIFilterConfiguration {
  final VectorParameter _redCoefficients;
  final VectorParameter _greenCoefficients;
  final VectorParameter _blueCoefficients;

  /// Create a [CIColorCrossPolynomialConfiguration] with default values.
  CIColorCrossPolynomialConfiguration()
      : _redCoefficients = CIVectorParameter(
          'inputRedCoefficients',
          'Red Coefficients',
          [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        _greenCoefficients = CIVectorParameter(
          'inputGreenCoefficients',
          'Green Coefficients',
          [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        _blueCoefficients = CIVectorParameter(
          'inputBlueCoefficients',
          'Blue Coefficients',
          [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
          10,
        ),
        super('CIColorCrossPolynomial');

  /// Polynomial coefficients for the red channel.
  ///
  /// Defaults to `[1, 0, 0, 0, 0, 0, 0, 0, 0, 0]`.
  set redCoefficients(List<double> value) {
    _redCoefficients.value = value;
  }

  /// Polynomial coefficients for the green channel.
  ///
  /// Defaults to `[0, 1, 0, 0, 0, 0, 0, 0, 0, 0]`.
  set greenCoefficients(List<double> value) {
    _greenCoefficients.value = value;
  }

  /// Polynomial coefficients for the blue channel.
  ///
  /// Defaults to `[0, 0, 1, 0, 0, 0, 0, 0, 0, 0]`.
  set blueCoefficients(List<double> value) {
    _blueCoefficients.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_redCoefficients, _greenCoefficients, _blueCoefficients];
}
