part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a droste screen filter.
///
/// * [insetPoint0] updates the `inputInsetPoint0` value of filter.
/// * [strands] updates the `inputStrands` value of filter.
/// * [insetPoint1] updates the `inputInsetPoint1` value of filter.
/// * [periodicity] updates the `inputPeriodicity` value of filter.
/// * [zoom] updates the `inputZoom` value of filter.
/// * [rotation] updates the `inputRotation` value of filter.
///
/// See also:
///
///  * [CIDroste](https://developer.apple.com/documentation/coreimage/cidroste), which
///    defines the exact information for filter.
class CIDrosteConfiguration extends CIFilterConfiguration {
  final PointParameter _insetPoint0;
  final NumberParameter _strands;
  final PointParameter _insetPoint1;
  final NumberParameter _periodicity;
  final NumberParameter _zoom;
  final NumberParameter _rotation;

  /// Create a [CIDrosteConfiguration] with default values.
  CIDrosteConfiguration()
    : _insetPoint0 = CGPositionParameter(
        'inputInsetPoint0',
        'Inset Point 0',
        const Point(200.0, 200.0),
      ),
      _strands = SliderNSNumberParameter(
        'inputStrands',
        'Strands',
        1,
        min: -10,
        max: 10,
      ),
      _insetPoint1 = CGPositionParameter(
        'inputInsetPoint1',
        'Inset Point 1',
        const Point(400.0, 400.0),
      ),
      _periodicity = SliderNSNumberParameter(
        'inputPeriodicity',
        'Periodicity',
        1,
        min: 1,
        max: 5,
      ),
      _zoom = SliderNSNumberParameter(
        'inputZoom',
        'Zoom',
        1,
        min: 0.01,
        max: 5,
      ),
      _rotation = SliderNSNumberParameter(
        'inputRotation',
        'Rotation',
        0,
        min: 0,
        max: 6.283185307179586,
      ),
      super('CIDroste');

  /// Set the inset point 0.
  ///
  /// The default value is `Point(200.0, 200.0)`.
  set insetPoint0(Point<double> value) {
    _insetPoint0.value = value;
  }

  /// Set the strands.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `-10.0` to `10.0`.
  set strands(double value) {
    _strands.value = value;
  }

  /// Set the inset point 1.
  ///
  /// The default value is `Point(400.0, 400.0)`.
  set insetPoint1(Point<double> value) {
    _insetPoint1.value = value;
  }

  /// Set the periodicity.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `1.0` to `5.0`.
  set periodicity(double value) {
    _periodicity.value = value;
  }

  /// Set the zoom.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.01` to `5.0`.
  set zoom(double value) {
    _zoom.value = value;
  }

  /// Set the rotation.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `6.283185307179586`.
  set rotation(double value) {
    _rotation.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.distortionEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _insetPoint0,
    _strands,
    _insetPoint1,
    _periodicity,
    _zoom,
    _rotation,
  ];
}
