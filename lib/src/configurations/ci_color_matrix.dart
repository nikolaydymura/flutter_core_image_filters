part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color curves filter.
///
/// * [gVector] updates the `inputGVector` value of filter.
/// * [biasVector] updates the `inputBiasVector` value of filter.
/// * [rVector] updates the `inputRVector` value of filter.
/// * [aVector] updates the `inputAVector` value of filter.
/// * [bVector] updates the `inputBVector` value of filter.
///
/// See also:
///
///  * [CIColorMatrix](https://developer.apple.com/documentation/coreimage/cicolormatrix), which
///    defines the exact information for filter.
class CIColorMatrixConfiguration extends CIFilterConfiguration {
  final VectorParameter _gVector;
  final VectorParameter _biasVector;
  final VectorParameter _rVector;
  final VectorParameter _aVector;
  final VectorParameter _bVector;

  /// Create a [CIColorMatrixConfiguration] with default values.
  CIColorMatrixConfiguration()
      : _gVector = CIVectorParameter(
          'inputGVector',
          'Green Vector',
          [0, 1, 0, 0],
        ),
        _biasVector = CIVectorParameter(
          'inputBiasVector',
          'Bias Vector',
          [0, 0, 0, 0],
        ),
        _rVector = CIVectorParameter(
          'inputRVector',
          'Red Vector',
          [1, 0, 0, 0],
        ),
        _aVector = CIVectorParameter(
          'inputAVector',
          'Alpha Vector',
          [0, 0, 0, 1],
        ),
        _bVector = CIVectorParameter(
          'inputBVector',
          'Blue Vector',
          [0, 0, 1, 0],
        ),
        super('CIColorMatrix');

  /// The amount of green to multiply the source color values by.
  ///
  /// Defaults to `[0, 1, 0, 0]`.
  set gVector(List<double> value) {
    _gVector.value = value;
  }

  /// A vector that’s added to each color component.
  ///
  /// Defaults to `[0, 0, 0, 0]`.
  set biasVector(List<double> value) {
    _biasVector.value = value;
  }

  /// The amount of red to multiply the source color values by.
  ///
  /// Defaults to `[1, 0, 0, 0]`.
  set rVector(List<double> value) {
    _rVector.value = value;
  }

  /// The amount of alpha to multiply the source color values by.
  ///
  /// Defaults to `[0, 0, 0, 1]`.
  set aVector(List<double> value) {
    _aVector.value = value;
  }

  /// The amount of blue to multiply the source color values by.
  ///
  /// Defaults to `[0, 0, 1, 0]`.
  set bVector(List<double> value) {
    _bVector.value = value;
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
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_gVector, _biasVector, _rVector, _aVector, _bVector];
}
