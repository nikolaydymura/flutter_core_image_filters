part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorClamp filter.
class CIColorClampConfiguration extends CIFilterConfiguration {
  final VectorParameter _maxComponents;
  final VectorParameter _minComponents;

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

  /// The maximum components.
  ///
  /// Defaults to [1, 1, 1, 1].
  set maxComponents(List<double> value) {
    _maxComponents.value = value;
  }

  /// The minimum components.
  ///
  /// Defaults to [0, 0, 0, 0].
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
