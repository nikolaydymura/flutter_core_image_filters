part of flutter_core_image_filters;

class CINinePartTiledConfiguration extends CIFilterConfiguration {
  final PointParameter _breakpoint1;
  final PointParameter _breakpoint0;
  final BoolParameter _flipYTiles;
  final PointParameter _growAmount;

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
        _flipYTiles = NSBoolParameter(
          'inputFlipYTiles',
          'Flip Y Tiles',
          true,
        ),
        _growAmount = CGPositionParameter(
          'inputGrowAmount',
          'Grow Amount',
          const Point(100.0, 100.0),
        ),
        super('CINinePartTiled');

  set breakpoint1(Point<double> value) {
    _breakpoint1.value = value;
  }

  set breakpoint0(Point<double> value) {
    _breakpoint0.value = value;
  }

  set flipYTiles(bool value) {
    _flipYTiles.value = value;
  }

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
  List<ConfigurationParameter> get parameters =>
      [_breakpoint1, _breakpoint0, _flipYTiles, _growAmount];
}
