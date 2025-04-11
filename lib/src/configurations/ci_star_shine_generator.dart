part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a star-shine generator filter.
///
/// * [epsilon] updates the `inputEpsilon` value of filter.
/// * [crossAngle] updates the `inputCrossAngle` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [crossScale] updates the `inputCrossScale` value of filter.
/// * [crossOpacity] updates the `inputCrossOpacity` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [crossWidth] updates the `inputCrossWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIStarShineGenerator](https://developer.apple.com/documentation/coreimage/cistarshinegenerator), which
///    defines the exact information for filter.
class CIStarShineGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _epsilon;
  final NumberParameter _crossAngle;
  final NumberParameter _radius;
  final NumberParameter _crossScale;
  final NumberParameter _crossOpacity;
  final ColorParameter _color;
  final NumberParameter _crossWidth;
  final PointParameter _center;

  /// Create a [CIStarShineGeneratorConfiguration] with default values.
  CIStarShineGeneratorConfiguration()
    : _epsilon = SliderNSNumberParameter(
        'inputEpsilon',
        'Epsilon',
        -2,
        min: -8,
        max: 0,
      ),
      _crossAngle = SliderNSNumberParameter(
        'inputCrossAngle',
        'Cross Angle',
        0.6,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        50,
        min: 0,
        max: 300,
      ),
      _crossScale = SliderNSNumberParameter(
        'inputCrossScale',
        'Cross Scale',
        15,
        min: 0,
        max: 100,
      ),
      _crossOpacity = SliderNSNumberParameter(
        'inputCrossOpacity',
        'Cross Opacity',
        -2,
        min: -8,
        max: 0,
      ),
      _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 204, 153, 1),
      ),
      _crossWidth = SliderNSNumberParameter(
        'inputCrossWidth',
        'Cross Width',
        2.5,
        min: 0.0,
        max: 10,
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      super('CIStarShineGenerator');

  /// The length of the cross spikes.
  ///
  /// Defaults to `-2.0`.
  ///
  /// Range: `-8.0` to `0.0`.
  set epsilon(double value) {
    _epsilon.value = value;
  }

  /// The angle of the cross pattern.
  ///
  /// Defaults to `0.6`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set crossAngle(double value) {
    _crossAngle.value = value;
  }

  /// The radius of the star.
  ///
  /// Defaults to `50.0`.
  ///
  /// Range: `0.0` to `300.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The size of the cross pattern.
  ///
  /// Defaults to `15.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set crossScale(double value) {
    _crossScale.value = value;
  }

  /// The opacity of the cross pattern.
  ///
  /// Defaults to `-2.0`.
  ///
  /// Range: `-8.0` to `0.0`.
  set crossOpacity(double value) {
    _crossOpacity.value = value;
  }

  /// The color to use for the outer shell of the circular star.
  ///
  /// Defaults to `Color.fromRGBO(255, 204, 153, 1)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The width of the cross pattern.
  ///
  /// Defaults to `2.5`.
  ///
  /// Range: `0.0` to `10.0`.
  set crossWidth(double value) {
    _crossWidth.value = value;
  }

  /// The x and y position to use as the center of the star.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.generator,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _epsilon,
    _crossAngle,
    _radius,
    _crossScale,
    _crossOpacity,
    _color,
    _crossWidth,
    _center,
  ];

  @override
  bool get hasInputImage => false;
}
