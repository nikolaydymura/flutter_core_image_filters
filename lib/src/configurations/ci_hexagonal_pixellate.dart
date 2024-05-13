part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a hexagonal pixellate filter.
///
/// * [scale] updates the `inputScale` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIHexagonalPixellate](https://developer.apple.com/documentation/coreimage/cihexagonalpixellate), which
///    defines the exact information for filter.
class CIHexagonalPixellateConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final PointParameter _center;

  /// Create a [CIHexagonalPixellateConfiguration] with default values.
  CIHexagonalPixellateConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          8,
          min: 1,
          max: 100,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIHexagonalPixellate');

  /// The size of the hexagons.
  ///
  /// Defaults to `8.0`.
  ///
  /// Range: `1.0` to `100.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _center];
}
