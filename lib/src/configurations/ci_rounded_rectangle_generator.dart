part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a rounded rectangle filter.
///
/// * [extent] updates the `inputExtent` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIRoundedRectangleGenerator](https://developer.apple.com/documentation/coreimage/ciroundedrectanglegenerator), which
///    defines the exact information for filter.
class CIRoundedRectangleGeneratorConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  final ColorParameter _color;
  final NumberParameter _radius;

  /// Create a [CIRoundedRectangleGeneratorConfiguration] with default values.
  CIRoundedRectangleGeneratorConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(
            0,
            0,
            100,
            100,
          ),
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 100,
        ),
        super('CIRoundedRectangleGenerator');

  /// The extent.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 100, 100)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The color.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1.0)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The radius.
  ///
  /// Defaults to `10.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_extent, _color, _radius];

  @override
  bool get hasInputImage => false;
}
