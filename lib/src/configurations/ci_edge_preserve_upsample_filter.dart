part of flutter_core_image_filters;

class CIEdgePreserveUpsampleFilterConfiguration extends CIFilterConfiguration
    with SmallImageMixin {
  final NumberParameter _lumaSigma;
  final NumberParameter _spatialSigma;

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

  set lumaSigma(double value) {
    _lumaSigma.value = value;
  }

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
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_lumaSigma, _spatialSigma, _smallImage];
}
