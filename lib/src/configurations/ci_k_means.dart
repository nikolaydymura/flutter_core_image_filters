part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a k-means filter.
///
/// * [extent] updates the `inputExtent` value of filter.
/// * [perceptual] updates the `inputPerceptual` value of filter.
/// * [count] updates the `inputCount` value of filter.
/// * [passes] updates the `inputPasses` value of filter.
///
/// See also:
///
///  * [CIKMeans](https://developer.apple.com/documentation/coreimage/cikmeans), which
///    defines the exact information for filter.
class CIKMeansConfiguration extends CIFilterConfiguration with MeansImageMixin {
  final RectParameter _extent;
  final BoolParameter _perceptual;
  final NumberParameter _count;
  final NumberParameter _passes;

  /// Create a [CIKMeansConfiguration] with default values.
  CIKMeansConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 640, 80),
        ),
        _perceptual = NSBoolParameter(
          'inputPerceptual',
          'Perceptual',
          false,
        ),
        _count = SliderNSIntegerParameter(
          'inputCount',
          'Count',
          8,
          min: 0,
          max: 128,
        ),
        _passes = SliderNSIntegerParameter(
          'inputPasses',
          'Passes',
          5,
          min: 0,
          max: 20,
        ),
        super('CIKMeans');

  /// The extent.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 640, 80)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The perceptual.
  ///
  /// Defaults to `false`.
  set perceptual(bool value) {
    _perceptual.value = value;
  }

  /// The count.
  ///
  /// Defaults to `8.0`.
  ///
  /// Range: `0.0` to `128.0`.
  set count(int value) {
    _count.value = value;
  }

  /// The count.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `0.0` to `20.0`.
  set passes(int value) {
    _passes.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.reduction,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_extent, _perceptual, _count, _passes, _meansImage];
}
