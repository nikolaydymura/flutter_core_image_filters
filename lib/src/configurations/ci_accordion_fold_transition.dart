part of flutter_core_image_filters;

class CIAccordionFoldTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _numberOfFolds;
  final NumberParameter _bottomHeight;
  final NumberParameter _foldShadowAmount;

  CIAccordionFoldTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _numberOfFolds = SliderNSNumberParameter(
          'inputNumberOfFolds',
          'Number of Folds',
          3,
          min: 1,
          max: 10,
        ),
        _bottomHeight = SliderNSNumberParameter(
          'inputBottomHeight',
          'Bottom Height',
          0,
          min: 0,
        ),
        _foldShadowAmount = SliderNSNumberParameter(
          'inputFoldShadowAmount',
          'Fold Shadow Amount',
          0.1,
          min: 0,
          max: 1,
        ),
        super('CIAccordionFoldTransition');

  set time(double value) {
    _time.value = value;
  }

  set numberOfFolds(double value) {
    _numberOfFolds.value = value;
  }

  set bottomHeight(double value) {
    _bottomHeight.value = value;
  }

  set foldShadowAmount(double value) {
    _foldShadowAmount.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_time, _numberOfFolds, _bottomHeight, _foldShadowAmount, _targetImage];
}
