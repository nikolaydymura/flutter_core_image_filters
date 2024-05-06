part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDroste filter.
class CIDrosteConfiguration extends CIFilterConfiguration {
  final PointParameter _insetPoint0;
  final NumberParameter _strands;
  final PointParameter _insetPoint1;
  final NumberParameter _periodicity;
  final NumberParameter _zoom;
  final NumberParameter _rotation;

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

  /// Set the inset point 0
  ///
  /// The default value is `const Point(200.0, 200.0)`
  set insetPoint0(Point<double> value) {
    _insetPoint0.value = value;
  }

  /// Set the strands
  ///
  /// Values are clamped to the range [-10, 10]. The default value is `1`
  set strands(double value) {
    _strands.value = value;
  }

  /// Set the inset point 1
  ///
  /// The default value is `(400.0, 400.0)`
  set insetPoint1(Point<double> value) {
    _insetPoint1.value = value;
  }

  /// Set the periodicity
  ///
  /// Values are clamped to the range [1, 5]. The default value is `1`
  set periodicity(double value) {
    _periodicity.value = value;
  }

  /// Set the zoom
  ///
  /// Values are clamped to the range [0.01, 5]. The default value is `1`
  set zoom(double value) {
    _zoom.value = value;
  }

  /// Set the rotation
  ///
  /// Values are clamped to the range [0, 6.283185307179586]. The default value is `0`
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
  List<ConfigurationParameter> get parameters =>
      [_insetPoint0, _strands, _insetPoint1, _periodicity, _zoom, _rotation];
}
