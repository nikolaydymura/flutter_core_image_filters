part of flutter_core_image_filters;

mixin MaskImageMixin on CIFilterConfiguration {
  final DataParameter _maskImage =
      CIImageParameter('inputMaskImage', 'Mask Image');

  set maskImage(Uint8List value) {
    _maskImage.data = value;
    _maskImage.asset = null;
    _maskImage.file = null;
  }

  set maskImageAsset(String value) {
    _maskImage.data = null;
    _maskImage.asset = value;
    _maskImage.file = null;
  }

  set maskImageFile(File value) {
    _maskImage.data = null;
    _maskImage.asset = null;
    _maskImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _maskImage];
}
