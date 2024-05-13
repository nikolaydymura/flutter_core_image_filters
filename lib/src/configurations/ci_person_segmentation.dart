part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a person segmentation filter.
///
/// * [qualityLevel] updates the `inputQualityLevel` value of filter.
///
/// See also:
///
///  * [CIPersonSegmentation](https://developer.apple.com/documentation/coreimage/cipersonsegmentation), which
///    defines the exact information for filter.
class CIPersonSegmentationConfiguration extends CIFilterConfiguration {
  final NumberParameter _qualityLevel;

  /// Create a [CIPersonSegmentationConfiguration] with default values.
  CIPersonSegmentationConfiguration()
      : _qualityLevel = NSNumberParameter(
          'inputQualityLevel',
          'Quality Level',
          double.nan,
        ),
        super('CIPersonSegmentation');

  /// The qualityLevel.
  ///
  /// Defaults to `double.nan`.
  set qualityLevel(double value) {
    _qualityLevel.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.stylize,
      };

  @override
  List<ConfigurationParameter> get parameters => [_qualityLevel];
}
