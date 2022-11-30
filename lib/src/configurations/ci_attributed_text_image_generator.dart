part of flutter_core_image_filters;

class CIAttributedTextImageGeneratorConfiguration
    extends CIFilterConfiguration {
  final NumberParameter _scaleFactor;

  CIAttributedTextImageGeneratorConfiguration()
      : _scaleFactor = SliderNSNumberParameter(
          'inputScaleFactor',
          'ScaleFactor',
          50,
          min: 0,
          max: 200,
        ),
        super('CIAttributedTextImageGenerator');

  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scaleFactor];
}
