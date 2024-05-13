part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a pointillize filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIPointillize](https://developer.apple.com/documentation/coreimage/cipointillize), which
///    defines the exact information for filter.
class CIPointillizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  /// Create a [CIPointillizeConfiguration] with default values.
  CIPointillizeConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          20,
          min: 1,
          max: 100,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIPointillize');

  /// The radius of the circles in the resulting pattern.
  ///
  /// Defaults to `20.0`.
  ///
  /// Range: `1.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
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
  List<ConfigurationParameter> get parameters => [_radius, _center];
}
