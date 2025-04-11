part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a nine part stretched filter.
///
/// * [breakpoint1] updates the `inputBreakpoint1` value of filter.
/// * [growAmount] updates the `inputGrowAmount` value of filter.
/// * [breakpoint0] updates the `inputBreakpoint0` value of filter.
///
/// See also:
///
///  * [CINinePartStretched](https://developer.apple.com/documentation/coreimage/cininepartstretched), which
///    defines the exact information for filter.
class CINinePartStretchedConfiguration extends CIFilterConfiguration {
  final PointParameter _breakpoint1;
  final PointParameter _growAmount;
  final PointParameter _breakpoint0;

  /// Create a [CINinePartStretchedConfiguration] with default values.
  CINinePartStretchedConfiguration()
    : _breakpoint1 = CGPositionParameter(
        'inputBreakpoint1',
        'Breakpoint1',
        const Point(150.0, 150.0),
      ),
      _growAmount = CGPositionParameter(
        'inputGrowAmount',
        'Grow Amount',
        const Point(100.0, 100.0),
      ),
      _breakpoint0 = CGPositionParameter(
        'inputBreakpoint0',
        'Breakpoint0',
        const Point(50.0, 50.0),
      ),
      super('CINinePartStretched');

  /// The breakpoint1.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set breakpoint1(Point<double> value) {
    _breakpoint1.value = value;
  }

  /// The growAmount.
  ///
  /// Defaults to `Point(100.0, 100.0)`.
  set growAmount(Point<double> value) {
    _growAmount.value = value;
  }

  /// The breakpoint0.
  ///
  /// Defaults to `Point(50.0, 50.0)`.
  set breakpoint0(Point<double> value) {
    _breakpoint0.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.distortionEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _breakpoint1,
    _growAmount,
    _breakpoint0,
  ];
}
