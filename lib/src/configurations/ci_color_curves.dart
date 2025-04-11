part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color curves filter.
///
/// * [curvesData] updates the `inputCurvesData` value of filter.
/// * [curvesDomain] updates the `inputCurvesDomain` value of filter.
///
/// See also:
///
///  * [CIColorCurves](https://developer.apple.com/documentation/coreimage/cicolorcurves), which
///    defines the exact information for filter.
class CIColorCurvesConfiguration extends CIFilterConfiguration
    with ColorSpaceMixin {
  final DataParameter _curvesData;
  final VectorParameter _curvesDomain;

  /// Create a [CIColorCurvesConfiguration] with default values.
  CIColorCurvesConfiguration()
    : _curvesData = NSDataParameter('inputCurvesData', 'Curves Data'),
      _curvesDomain = CIVectorParameter('inputCurvesDomain', 'Curves Domain', [
        0.0,
        1.0,
      ]),
      super('CIColorCurves');

  /// A two-element vector that defines the minimum and maximum values of the curve data.
  ///
  /// Defaults to `[0.0, 1.0]`.
  set curvesDomain(List<double> value) {
    _curvesDomain.value = value;
  }

  /// Color values that determine the color curves transform.
  set curvesData(Uint8List value) {
    _curvesData.data = value;
    _curvesData.asset = null;
    _curvesData.file = null;
  }

  /// The asset name for the curves.
  set curvesDataAsset(String value) {
    _curvesData.data = null;
    _curvesData.asset = value;
    _curvesData.file = null;
  }

  /// The file for the curves.
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
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _curvesData,
    _curvesDomain,
  ];
}
