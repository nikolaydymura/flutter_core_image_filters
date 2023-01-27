part of flutter_core_image_filters;

class CIColorCurvesConfiguration extends CIFilterConfiguration {
  final StringParameter _colorSpace;
  final DataParameter _curvesData;

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
        super('CIColorCurves');

  set colorSpace(String value) {
    _colorSpace.value = value;
  }

  set curvesData0(Uint8List value) {
    _curvesData.data = value;
    _curvesData.asset = null;
    _curvesData.file = null;
  }

  set curvesData0Asset(String value) {
    _curvesData.data = null;
    _curvesData.asset = value;
    _curvesData.file = null;
  }

  set curvesData0File(File value) {
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
  List<ConfigurationParameter> get parameters => [_colorSpace, _curvesData];
}
