part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an edge preserve upsample filter.
///
/// * [lumaSigma] updates the `inputLumaSigma` value of filter.
/// * [spatialSigma] updates the `inputSpatialSigma` value of filter.
///
/// See also:
///
///  * [CIEdgePreserveUpsampleFilter](https://developer.apple.com/documentation/coreimage/ciedgepreserveupsample), which
///    defines the exact information for filter.
class CIEdgePreserveUpsampleFilterConfiguration extends CIFilterConfiguration
    with SmallImageMixin {
  final NumberParameter _lumaSigma;
  final NumberParameter _spatialSigma;

  /// Create a [CIEdgePreserveUpsampleFilterConfiguration] with default values.
  CIEdgePreserveUpsampleFilterConfiguration()
      : _lumaSigma = SliderNSNumberParameter(
          'inputLumaSigma',
          'Luma Sigma',
          0.15,
          min: 0,
          max: 1,
        ),
        _spatialSigma = SliderNSNumberParameter(
          'inputSpatialSigma',
          'Spatial Sigma',
          3,
          min: 0,
          max: 5,
        ),
        super('CIEdgePreserveUpsampleFilter');

  /// A value that specifies the influence of the input image’s luma information on the upsampling operation.
  ///
  /// Defaults to `0.15`.
  ///
  /// Range: `0.0` to `1.0`.
  set lumaSigma(double value) {
    _lumaSigma.value = value;
  }

  /// A value that specifies the influence of the input image’s spatial information on the upsampling operation.
  ///
  /// Defaults to `3.0`.
  ///
  /// Range: `0.0` to `5.0`.
  set spatialSigma(double value) {
    _spatialSigma.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_lumaSigma, _spatialSigma, _smallImage];
}
