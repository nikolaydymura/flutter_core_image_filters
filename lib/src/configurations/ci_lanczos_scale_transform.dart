part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a Lanczos scale transform filter.
///
/// * [scale] updates the `inputScale` value of filter.
/// * [aspectRatio] updates the `inputAspectRatio` value of filter.
///
/// See also:
///
///  * [CILanczosScaleTransform](https://developer.apple.com/documentation/coreimage/cilanczosscaletransform), which
///    defines the exact information for filter.
class CILanczosScaleTransformConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;
  final NumberParameter _aspectRatio;

  /// Create a [CILanczosScaleTransformConfiguration] with default values.
  CILanczosScaleTransformConfiguration()
    : _scale = SliderNSNumberParameter(
        'inputScale',
        'Scale',
        1,
        min: 0.0,
        max: 1.5,
      ),
      _aspectRatio = SliderNSNumberParameter(
        'inputAspectRatio',
        'Aspect Ratio',
        1,
        min: 0.0,
        max: 2,
      ),
      super('CILanczosScaleTransform');

  /// The scaling factor to use on the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.5`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The additional horizontal scaling factor to use on the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `2.0`.
  set aspectRatio(double value) {
    _aspectRatio.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.geometryAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _aspectRatio];
}
