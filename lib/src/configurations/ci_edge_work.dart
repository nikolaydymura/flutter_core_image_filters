part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an edge-work filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIEdgeWork](https://developer.apple.com/documentation/coreimage/ciedgework), which
///    defines the exact information for filter.
class CIEdgeWorkConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIEdgeWorkConfiguration] with default values.
  CIEdgeWorkConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          3,
          min: 0,
          max: 20,
        ),
        super('CIEdgeWork');

  /// The thickness of the edges.
  ///
  /// Defaults to `3.0`.
  ///
  /// Range: `0.0` to `20.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
