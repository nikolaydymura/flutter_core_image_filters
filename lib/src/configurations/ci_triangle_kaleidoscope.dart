part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a triangle kaleidoscope filter.
///
/// * [decay] updates the `inputDecay` value of filter.
/// * [point] updates the `inputPoint` value of filter.
/// * [rotation] updates the `inputRotation` value of filter.
/// * [size] updates the `inputSize` value of filter.
///
/// See also:
///
///  * [CITriangleKaleidoscope](https://developer.apple.com/documentation/coreimage/citrianglekaleidoscope), which
///    defines the exact information for filter.
class CITriangleKaleidoscopeConfiguration extends CIFilterConfiguration {
  final NumberParameter _decay;
  final PointParameter _point;
  final NumberParameter _rotation;
  final NumberParameter _size;

  /// Create a [CITriangleKaleidoscopeConfiguration] with default values.
  CITriangleKaleidoscopeConfiguration()
      : _decay = SliderNSNumberParameter(
          'inputDecay',
          'Decay',
          0.85,
          min: 0,
          max: 1,
        ),
        _point = CGPositionParameter(
          'inputPoint',
          'Point',
          const Point(150.0, 150.0),
        ),
        _rotation = SliderNSNumberParameter(
          'inputRotation',
          'Rotation',
          5.924285296593801,
          min: 0,
          max: 6.283185307179586,
        ),
        _size = SliderNSNumberParameter(
          'inputSize',
          'Size',
          700,
          min: 0,
          max: 1000,
        ),
        super('CITriangleKaleidoscope');

  /// A value that determines how fast the color fades from the center triangle.
  ///
  /// Defaults to `0.85`.
  ///
  /// Range: `0.0` to `1.0`.
  set decay(double value) {
    _decay.value = value;
  }

  /// The x and y position to use as the center of the triangular area in the input image.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set point(Point<double> value) {
    _point.value = value;
  }

  /// The rotation angle of the triangle.
  ///
  /// Defaults to `5.924285296593801`.
  ///
  /// Range: `0.0` to `6.283185307179586`.
  set rotation(double value) {
    _rotation.value = value;
  }

  /// The size, in pixels, of the triangle.
  ///
  /// Defaults to `700.0`.
  ///
  /// Range: `0.0` to `1000.0`.
  set size(double value) {
    _size.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_decay, _point, _rotation, _size];
}
