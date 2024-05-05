part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAccordionFoldTransition filter.
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
          max: 50,
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

  /// The amount of the transition to complete.
  ///
  /// This value ranges from 0.0 to 1.0.
  set time(double value) {
    _time.value = value;
  }

  /// The number of folds in the transition.
  ///
  /// This value ranges from 1 to 50.
  set numberOfFolds(double value) {
    _numberOfFolds.value = value;
  }

  /// The height of the bottom of the image.
  ///
  /// This value ranges from 0.0 to 1.0.
  set bottomHeight(double value) {
    _bottomHeight.value = value;
  }

  /// The amount of shadow to apply to the folds.
  ///
  /// This value ranges from 0.0 to 1.0.
  set foldShadowAmount(double value) {
    _foldShadowAmount.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_time, _numberOfFolds, _bottomHeight, _foldShadowAmount, _targetImage];
}
