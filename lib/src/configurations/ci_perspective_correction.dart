part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a perspective correction filter.
///
/// * [bottomLeft] updates the `inputBottomLeft` value of filter.
/// * [topRight] updates the `inputTopRight` value of filter.
/// * [topLeft] updates the `inputTopLeft` value of filter.
/// * [crop] updates the `inputCrop` value of filter.
/// * [bottomRight] updates the `inputBottomRight` value of filter.
///
/// See also:
///
///  * [CIPerspectiveCorrection](https://developer.apple.com/documentation/coreimage/ciperspectivecorrection), which
///    defines the exact information for filter.
class CIPerspectiveCorrectionConfiguration extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topRight;
  final PointParameter _topLeft;
  final BoolParameter _crop;
  final PointParameter _bottomRight;

  /// Create a [CIPerspectiveCorrectionConfiguration] with default values.
  CIPerspectiveCorrectionConfiguration()
      : _bottomLeft = CGPositionParameter(
          'inputBottomLeft',
          'Bottom Left',
          const Point(155.0, 153.0),
        ),
        _topRight = CGPositionParameter(
          'inputTopRight',
          'Top Right',
          const Point(646.0, 507.0),
        ),
        _topLeft = CGPositionParameter(
          'inputTopLeft',
          'Top Left',
          const Point(118.0, 484.0),
        ),
        _crop = NSBoolParameter(
          'inputCrop',
          'Crop',
          true,
        ),
        _bottomRight = CGPositionParameter(
          'inputBottomRight',
          'Bottom Right',
          const Point(548.0, 140.0),
        ),
        super('CIPerspectiveCorrection');

  /// The bottomLeft.
  ///
  /// Defaults to `Point(155.0, 153.0)`.
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  /// The topRight.
  ///
  /// Defaults to `Point(646.0, 507.0)`.
  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  /// The topLeft.
  ///
  /// Defaults to `Point(118.0, 484.0)`.
  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  /// The crop.
  ///
  /// Defaults to `true`.
  set crop(bool value) {
    _crop.value = value;
  }

  /// The bottomRight.
  ///
  /// Defaults to `Point(548.0, 140.0)`.
  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_bottomLeft, _topRight, _topLeft, _crop, _bottomRight];
}
