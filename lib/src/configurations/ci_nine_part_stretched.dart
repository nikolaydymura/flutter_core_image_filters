part of flutter_core_image_filters;

class CINinePartStretchedConfiguration extends CIFilterConfiguration {
  final PointParameter _breakpoint1;
  final PointParameter _growAmount;
  final PointParameter _breakpoint0;

  CINinePartStretchedConfiguration()
      : _breakpoint1 = CGPositionParameter(
          'inputBreakpoint1',
          'Breakpoint1',
          const Point(150.0, 150.0),
        ),
        _growAmount = CGPositionParameter(
          'inputGrowAmount',
          'GrowAmount',
          const Point(100.0, 100.0),
        ),
        _breakpoint0 = CGPositionParameter(
          'inputBreakpoint0',
          'Breakpoint0',
          const Point(50.0, 50.0),
        ),
        super('CINinePartStretched');
  set breakpoint1(Point<double> value) {
    _breakpoint1.value = value;
  }

  set growAmount(Point<double> value) {
    _growAmount.value = value;
  }

  set breakpoint0(Point<double> value) {
    _breakpoint0.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_breakpoint1, _growAmount, _breakpoint0];
}
