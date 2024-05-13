part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color polynomial filter.
///
/// * [redCoefficients] updates the `inputRedCoefficients` value of filter.
/// * [greenCoefficients] updates the `inputGreenCoefficients` value of filter.
/// * [alphaCoefficients] updates the `inputAlphaCoefficients` value of filter.
/// * [blueCoefficients] updates the `inputBlueCoefficients` value of filter.
///
/// See also:
///
///  * [CIColorPolynomial](https://developer.apple.com/documentation/coreimage/cicolorpolynomial), which
///    defines the exact information for filter.
class CIColorPolynomialConfiguration extends CIFilterConfiguration {
  final VectorParameter _redCoefficients;
  final VectorParameter _greenCoefficients;
  final VectorParameter _alphaCoefficients;

  final VectorParameter _blueCoefficients;

  /// Create a [CIColorPolynomialConfiguration] with default values.
  CIColorPolynomialConfiguration()
      : _redCoefficients = CIVectorParameter(
          'inputRedCoefficients',
          'Red Coefficients',
          [0, 1, 0, 0],
        ),
        _greenCoefficients = CIVectorParameter(
          'inputGreenCoefficients',
          'Green Coefficients',
          [0, 1, 0, 0],
        ),
        _alphaCoefficients = CIVectorParameter(
          'inputAlphaCoefficients',
          'Alpha Coefficients',
          [0, 1, 0, 0],
        ),
        _blueCoefficients = CIVectorParameter(
          'inputBlueCoefficients',
          'Blue Coefficients',
          [0, 1, 0, 0],
        ),
        super('CIColorPolynomial');

  /// Polynomial coefficients for the red channel.
  ///
  /// Defaults to `[0, 1, 0, 0]`.
  set redCoefficients(List<double> value) {
    _redCoefficients.value = value;
  }

  /// Polynomial coefficients for the green channel.
  ///
  /// Defaults to `[0, 1, 0, 0]`.
  set greenCoefficients(List<double> value) {
    _greenCoefficients.value = value;
  }

  /// Polynomial coefficients for the blue channel.
  ///
  /// Defaults to `[0, 1, 0, 0]`.
  set blueCoefficients(List<double> value) {
    _blueCoefficients.value = value;
  }

  /// Polynomial coefficients for the alpha channel.
  ///
  /// Defaults to `[0, 1, 0, 0]`.
  set alphaCoefficients(List<double> value) {
    _alphaCoefficients.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _redCoefficients,
        _greenCoefficients,
        _alphaCoefficients,
        _blueCoefficients,
      ];
}
