part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an edges filter.
///
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CIEdges](https://developer.apple.com/documentation/coreimage/ciedges), which
///    defines the exact information for filter.
class CIEdgesConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  /// Create a [CIEdgesConfiguration] with default values.
  CIEdgesConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 10,
        ),
        super('CIEdges');

  /// The intensity of the edges.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `10.0`.
  set intensity(double value) {
    _intensity.value = value;
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
  List<ConfigurationParameter> get parameters => [_intensity];
}
