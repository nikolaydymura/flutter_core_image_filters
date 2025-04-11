part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an accordion fold transition filter.
///
/// * [time] updates the `inputTime` value of filter.
/// * [numberOfFolds] updates the `inputNumberOfFolds` value of filter.
/// * [bottomHeight] updates the `inputBottomHeight` value of filter.
/// * [foldShadowAmount] updates the `inputFoldShadowAmount` value of filter.
///
/// See also:
///
///  * [CIAccordionFoldTransition](https://developer.apple.com/documentation/coreimage/ciaccordionfoldtransition), which
///    defines the exact information for filter.
class CIAccordionFoldTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _numberOfFolds;
  final NumberParameter _bottomHeight;
  final NumberParameter _foldShadowAmount;

  /// Create a [CIAccordionFoldTransitionConfiguration] with default values.
  CIAccordionFoldTransitionConfiguration()
    : _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
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
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The number of folds used in the transition.
  ///
  /// Defaults to `3.0`.
  ///
  /// This value ranges from `1.0` to `50.0`.
  set numberOfFolds(double value) {
    _numberOfFolds.value = value;
  }

  /// The height of the accordion-fold part of the transition.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set bottomHeight(double value) {
    _bottomHeight.value = value;
  }

  /// A value that specifies the intensity of the shadow in the transition.
  ///
  /// Defaults to `0.1`.
  ///
  /// This value ranges from `0.0` to `1.0`.
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
  List<ConfigurationParameter> get parameters => [
    _time,
    _numberOfFolds,
    _bottomHeight,
    _foldShadowAmount,
    _targetImage,
  ];
}
