part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color clamp filter.
///
/// * [maxComponents] updates the `inputMaxComponents` value of filter.
/// * [minComponents] updates the `inputMinComponents` value of filter.
///
/// See also:
///
///  * [CIColorClamp](https://developer.apple.com/documentation/coreimage/cicolorclamp), which
///    defines the exact information for filter.
class CIColorClampConfiguration extends CIFilterConfiguration {
  final VectorParameter _maxComponents;
  final VectorParameter _minComponents;

  /// Create a [CIColorClampConfiguration] with default values.
  CIColorClampConfiguration()
      : _maxComponents = CIVectorParameter(
          'inputMaxComponents',
          'Max Components',
          [1, 1, 1, 1],
        ),
        _minComponents = CIVectorParameter(
          'inputMinComponents',
          'Min Components',
          [0, 0, 0, 0],
        ),
        super('CIColorClamp');

  /// A vector containing the higher clamping values.
  ///
  /// Defaults to `[1, 1, 1, 1]`.
  set maxComponents(List<double> value) {
    _maxComponents.value = value;
  }

  /// A vector containing the lower clamping values.
  ///
  /// Defaults to `[0, 0, 0, 0]`.
  set minComponents(List<double> value) {
    _minComponents.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_maxComponents, _minComponents];
}
