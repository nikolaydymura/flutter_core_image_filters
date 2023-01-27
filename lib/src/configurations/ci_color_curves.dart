part of flutter_core_image_filters;

class CIColorCurvesConfiguration extends CIFilterConfiguration {
  final StringParameter _colorSpace;
  final DataParameter _curvesData;
  final VectorParameter _curvesDomain;

  CIColorCurvesConfiguration()
      : _colorSpace = NSStringParameter(
          'inputColorSpace',
          'Color Space',
          '',
        ),
        _curvesData = NSDataParameter(
          'inputCurvesData',
          'Curves Data',
        ),
        _curvesDomain =
            CIVectorParameter('inputCurvesDomain', 'Curves Domain', [0.0, 1.0]),
        super('CIColorCurves');

  set colorSpace(String value) {
    _colorSpace.value = value;
  }

  set curvesDomain(List<double> value) {
    _curvesDomain.value = value;
  }

  set curvesData(Uint8List value) {
    _curvesData.data = value;
    _curvesData.asset = null;
    _curvesData.file = null;
  }

  set curvesDataAsset(String value) {
    _curvesData.data = null;
    _curvesData.asset = value;
    _curvesData.file = null;
  }

  set curvesDataFile(File value) {
    _curvesData.data = null;
    _curvesData.asset = null;
    _curvesData.file = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_colorSpace, _curvesData, _curvesDomain];
}
