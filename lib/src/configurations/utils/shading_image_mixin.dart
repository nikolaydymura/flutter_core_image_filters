part of flutter_core_image_filters;

mixin ShadingImageMixin on CIFilterConfiguration {
  final DataParameter _shadingImage =
      CIImageParameter('inputShadingImage', 'Shading Image');

  set shadingImage(Uint8List value) {
    _shadingImage.data = value;
    _shadingImage.asset = null;
    _shadingImage.file = null;
  }

  set shadingImageAsset(String value) {
    _shadingImage.data = null;
    _shadingImage.asset = value;
    _shadingImage.file = null;
  }

  set shadingImageFile(File value) {
    _shadingImage.data = null;
    _shadingImage.asset = null;
    _shadingImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _shadingImage];
// coverage:ignore-end
}
