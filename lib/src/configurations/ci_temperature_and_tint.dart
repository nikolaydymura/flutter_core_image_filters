part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a temperature and tint filter.
///
/// * [targetNeutral] updates the `inputTargetNeutral` value of filter.
/// * [neutral] updates the `inputNeutral` value of filter.
///
/// See also:
///
///  * [CITemperatureAndTint](https://developer.apple.com/documentation/coreimage/citemperatureandtint), which
///    defines the exact information for filter.
class CITemperatureAndTintConfiguration extends CIFilterConfiguration {
  final PointParameter _targetNeutral;
  final PointParameter _neutral;

  /// Create a [CITemperatureAndTintConfiguration] with default values.
  CITemperatureAndTintConfiguration()
      : _targetNeutral = CGPositionParameter(
          'inputTargetNeutral',
          'Target Neutral',
          const Point(6500.0, 0.0),
        ),
        _neutral = CGPositionParameter(
          'inputNeutral',
          'Neutral',
          const Point(6500.0, 0.0),
        ),
        super('CITemperatureAndTint');

  /// A vector containing the desired white point defined by color temperature and tint.
  ///
  /// Defaults to `Point(6500.0, 0.0)`.
  set targetNeutral(Point<double> value) {
    _targetNeutral.value = value;
  }

  /// A vector containing the source white point defined by color temperature and tint.
  ///
  /// Defaults to `Point(6500.0, 0.0)`.
  set neutral(Point<double> value) {
    _neutral.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_targetNeutral, _neutral];
}
