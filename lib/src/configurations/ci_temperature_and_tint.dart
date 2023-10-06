part of flutter_core_image_filters;

class CITemperatureAndTintConfiguration extends CIFilterConfiguration {
  final PointParameter _targetNeutral;
  final PointParameter _neutral;

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

  set targetNeutral(Point<double> value) {
    _targetNeutral.value = value;
  }

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
