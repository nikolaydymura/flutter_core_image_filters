part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIDisintegrateWithMaskTransition filter.
class CIDisintegrateWithMaskTransitionConfiguration
    extends CIFilterConfiguration with TargetImageMixin, MaskImageMixin {
  final NumberParameter _time;
  final PointParameter _shadowOffset;
  final NumberParameter _shadowDensity;
  final NumberParameter _shadowRadius;

  CIDisintegrateWithMaskTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _shadowOffset = CGPositionParameter(
          'inputShadowOffset',
          'Shadow Offset',
          const Point(0, -10),
        ),
        _shadowDensity = SliderNSNumberParameter(
          'inputShadowDensity',
          'Shadow Density',
          0.65,
          min: 0,
          max: 1,
        ),
        _shadowRadius = SliderNSNumberParameter(
          'inputShadowRadius',
          'Shadow Radius',
          8,
          min: 0,
          max: 50,
        ),
        super('CIDisintegrateWithMaskTransition');

  /// Set the time
  ///
  /// The default value is `0`
  set time(double value) {
    _time.value = value;
  }

  /// Set the shadow offset
  ///
  /// The default value is `(0, -10)`
  set shadowOffset(Point<double> value) {
    _shadowOffset.value = value;
  }

  /// Set the shadow density
  ///
  /// The default value is `0.65`
  set shadowDensity(double value) {
    _shadowDensity.value = value;
  }

  /// Set the shadow radius
  ///
  /// The default value is `8`
  set shadowRadius(double value) {
    _shadowRadius.value = value;
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
        _shadowOffset,
        _shadowDensity,
        _shadowRadius,
        _targetImage,
        _maskImage,
      ];
}
