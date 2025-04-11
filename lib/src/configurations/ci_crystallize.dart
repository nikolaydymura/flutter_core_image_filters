part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a crystalize filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CICrystallize](https://developer.apple.com/documentation/coreimage/cicrystallize), which
///    defines the exact information for filter.
class CICrystallizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  /// Create a [CICrystallizeConfiguration] with default values.
  CICrystallizeConfiguration()
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
      super('CICrystallize');

  /// The radius, in pixels, of the effect.
  ///
  /// Defaults to `20.0`.
  ///
  /// This value ranges from `1.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center of the effect as x and y coordinates.
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
