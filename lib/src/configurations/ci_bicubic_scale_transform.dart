part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a bars swipe transition filter.
///
/// * [b] updates the `inputB` value of filter.
/// * [scale] updates the `inputScale` value of filter.
/// * [c] updates the `inputC` value of filter.
/// * [aspectRatio] updates the `inputAspectRatio` value of filter.
///
/// See also:
///
///  * [CIBicubicScaleTransform](https://developer.apple.com/documentation/coreimage/cibicubicscaletransform), which
///    defines the exact information for filter.
class CIBicubicScaleTransformConfiguration extends CIFilterConfiguration {
  final NumberParameter _b;
  final NumberParameter _scale;
  final NumberParameter _c;
  final NumberParameter _aspectRatio;

  /// Create a [CIBicubicScaleTransformConfiguration] with default values.
  CIBicubicScaleTransformConfiguration()
      : _b = SliderNSNumberParameter(
          'inputB',
          'B',
          0,
          min: 0,
          max: 1,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          1,
          min: 0.00,
          max: 100,
        ),
        _c = SliderNSNumberParameter(
          'inputC',
          'C',
          0.75,
          min: 0,
          max: 1,
        ),
        _aspectRatio = SliderNSNumberParameter(
          'inputAspectRatio',
          'Aspect Ratio',
          1,
          min: 0,
          max: 2,
        ),
        super('CIBicubicScaleTransform');

  /// The value of B to use for the cubic resampling function.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set b(double value) {
    _b.value = value;
  }

  /// The scaling factor to use on the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `100.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The value of C to use for the cubic resampling function.
  ///
  /// Defaults to `0.75`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set c(double value) {
    _c.value = value;
  }

  /// The additional horizontal scaling factor to use on the image.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `2.0`.
  set aspectRatio(double value) {
    _aspectRatio.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.nonSquarePixels,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_b, _scale, _c, _aspectRatio];
}
