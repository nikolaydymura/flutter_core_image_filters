part of flutter_core_image_filters;

class CITemperatureAndTintConfiguration extends CIFilterConfiguration {
  final VectorParameter _targetNeutral;
  final VectorParameter _neutral;

  CITemperatureAndTintConfiguration()
      : _targetNeutral = CIVectorParameter(
          'inputTargetNeutral',
          'Target Neutral',
          [6500, 0],
        ),
        _neutral = CIVectorParameter(
          'inputNeutral',
          'Neutral',
          [6500, 0],
        ),
        super('CITemperatureAndTint');

  set targetNeutral(List<double> value) {
    _targetNeutral.value = value;
  }

  set neutral(List<double> value) {
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
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_targetNeutral, _neutral];
}
