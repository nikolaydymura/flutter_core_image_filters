part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a keystone correction horizontal filter.
///
/// * [topRight] updates the `inputTopRight` value of filter.
/// * [topLeft] updates the `inputTopLeft` value of filter.
/// * [bottomLeft] updates the `inputBottomLeft` value of filter.
/// * [bottomRight] updates the `inputBottomRight` value of filter.
/// * [focalLength] updates the `inputFocalLength` value of filter.
///
/// See also:
///
///  * [CIKeystoneCorrectionHorizontal](https://developer.apple.com/documentation/coreimage/cikeystonecorrectionhorizontal), which
///    defines the exact information for filter.
class CIKeystoneCorrectionHorizontalConfiguration
    extends CIFilterConfiguration {
  final PointParameter _topRight;
  final PointParameter _topLeft;
  final PointParameter _bottomLeft;
  final PointParameter _bottomRight;
  final NumberParameter _focalLength;

  /// Create a [CIKeystoneCorrectionHorizontalConfiguration] with default values.
  CIKeystoneCorrectionHorizontalConfiguration()
    : _topRight = CGPositionParameter(
        'inputTopRight',
        'Top Right',
        const Point(0.0, 0.0),
      ),
      _topLeft = CGPositionParameter(
        'inputTopLeft',
        'Top Left',
        const Point(0.0, 0.0),
      ),
      _bottomLeft = CGPositionParameter(
        'inputBottomLeft',
        'Bottom Left',
        const Point(0.0, 0.0),
      ),
      _bottomRight = CGPositionParameter(
        'inputBottomRight',
        'Bottom Right',
        const Point(0.0, 0.0),
      ),
      _focalLength = NSNumberParameter('inputFocalLength', 'Focal Length', 28),
      super('CIKeystoneCorrectionHorizontal');

  /// The topRight.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  /// The topLeft.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  /// The bottomLeft.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  /// The bottomRight.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  /// The focalLength.
  ///
  /// Defaults to `28`.
  set focalLength(double value) {
    _focalLength.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.geometryAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _topRight,
    _topLeft,
    _bottomLeft,
    _bottomRight,
    _focalLength,
  ];
}
