part of flutter_core_image_filters;

mixin GradientImageMixin on CIFilterConfiguration {
  final DataParameter _gradientImage =
      CIImageParameter('inputGradientImage', 'Gradient Image');

  set gradientImage(Uint8List value) {
    _gradientImage.data = value;
    _gradientImage.asset = null;
    _gradientImage.file = null;
  }

  set gradientImageAsset(String value) {
    _gradientImage.data = null;
    _gradientImage.asset = value;
    _gradientImage.file = null;
  }

  set gradientImageFile(File value) {
    _gradientImage.data = null;
    _gradientImage.asset = null;
    _gradientImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _gradientImage];
// coverage:ignore-end
}
