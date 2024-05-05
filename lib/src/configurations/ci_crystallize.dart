part of '../../flutter_core_image_filters.dart';

/// A configuration for a CICrystallize filter.
class CICrystallizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

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

  /// The radius value.
  ///
  /// Ranges from 1 to 100.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center point.
  ///
  /// Defaults to (150.0, 150.0).
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
