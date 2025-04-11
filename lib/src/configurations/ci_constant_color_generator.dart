part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIConstantColorGenerator filter.
class CIConstantColorGeneratorConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;

  CIConstantColorGeneratorConfiguration()
    : _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 0, 0, 1.0),
      ),
      super('CIConstantColorGenerator');

  @override
  bool get hasInputImage => false;

  /// The color of the effect.
  ///
  /// Defaults to Color.fromRGBO(255, 0, 0, 1.0).
  set color(Color value) {
    _color.value = value;
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
  List<ConfigurationParameter> get parameters => [_color];
}
