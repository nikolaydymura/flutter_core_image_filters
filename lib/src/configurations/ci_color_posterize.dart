part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color posterize filter.
///
/// * [levels] updates the `inputLevels` value of filter.
///
/// See also:
///
///  * [CIColorPosterize](https://developer.apple.com/documentation/coreimage/cicolorposterize), which
///    defines the exact information for filter.
class CIColorPosterizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _levels;

  /// Create a [CIColorPosterizeConfiguration] with default values.
  CIColorPosterizeConfiguration()
      : _levels = SliderNSNumberParameter(
          'inputLevels',
          'Levels',
          6,
          min: 1,
          max: 30,
        ),
        super('CIColorPosterize');

  /// The number of brightness levels to use for each color component.
  ///
  /// Defaults to `6.0`.
  ///
  /// This value ranges from `1.0` to `30.0`.
  set levels(double value) {
    _levels.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_levels];
}
