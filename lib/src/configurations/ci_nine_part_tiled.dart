part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a nine part tiled filter.
///
/// * [breakpoint1] updates the `inputBreakpoint1` value of filter.
/// * [breakpoint0] updates the `inputBreakpoint0` value of filter.
/// * [flipYTiles] updates the `inputFlipYTiles` value of filter.
/// * [growAmount] updates the `inputGrowAmount` value of filter.
///
/// See also:
///
///  * [CINinePartTiled](https://developer.apple.com/documentation/coreimage/cinineparttiled), which
///    defines the exact information for filter.
class CINinePartTiledConfiguration extends CIFilterConfiguration {
  final PointParameter _breakpoint1;
  final PointParameter _breakpoint0;
  final BoolParameter _flipYTiles;
  final PointParameter _growAmount;

  /// Create a [CINinePartTiledConfiguration] with default values.
  CINinePartTiledConfiguration()
    : _breakpoint1 = CGPositionParameter(
        'inputBreakpoint1',
        'Breakpoint1',
        const Point(150.0, 150.0),
      ),
      _breakpoint0 = CGPositionParameter(
        'inputBreakpoint0',
        'Breakpoint0',
        const Point(50.0, 50.0),
      ),
      _flipYTiles = NSBoolParameter('inputFlipYTiles', 'Flip Y Tiles', true),
      _growAmount = CGPositionParameter(
        'inputGrowAmount',
        'Grow Amount',
        const Point(100.0, 100.0),
      ),
      super('CINinePartTiled');

  /// The breakpoint1.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set breakpoint1(Point<double> value) {
    _breakpoint1.value = value;
  }

  /// The breakpoint0.
  ///
  /// Defaults to `Point(50.0, 50.0)`.
  set breakpoint0(Point<double> value) {
    _breakpoint0.value = value;
  }

  /// The flipYTiles.
  ///
  /// Defaults to `true`.
  set flipYTiles(bool value) {
    _flipYTiles.value = value;
  }

  /// The growAmount.
  ///
  /// Defaults to `Point(100.0, 100.0)`.
  set growAmount(Point<double> value) {
    _growAmount.value = value;
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
    _breakpoint0,
    _flipYTiles,
    _growAmount,
  ];
}
