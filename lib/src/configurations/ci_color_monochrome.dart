part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorMonochrome filter.
class CIColorMonochromeConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;
  final ColorParameter _color;

  CIColorMonochromeConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 1,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(153, 115, 76, 1.0),
        ),
        super('CIColorMonochrome');

  /// The intensity of the effect.
  ///
  /// This value ranges from 0.0 to 1.0.
  set intensity(double value) {
    _intensity.value = value;
  }

  /// The color of the effect.
  ///
  /// Defaults to Color.fromRGBO(153, 115, 76, 1.0).
  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _color];
}
