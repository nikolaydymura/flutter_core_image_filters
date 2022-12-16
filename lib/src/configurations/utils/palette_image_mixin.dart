part of flutter_core_image_filters;

mixin PaletteImageMixin on CIFilterConfiguration {
  final DataParameter _paletteImage =
      CIImageParameter('inputPaletteImage', 'Palette Image');

  set paletteImage(Uint8List value) {
    _paletteImage.data = value;
    _paletteImage.asset = null;
    _paletteImage.file = null;
  }

  set paletteImageAsset(String value) {
    _paletteImage.data = null;
    _paletteImage.asset = value;
    _paletteImage.file = null;
  }

  set paletteImageFile(File value) {
    _paletteImage.data = null;
    _paletteImage.asset = null;
    _paletteImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _paletteImage];
}
