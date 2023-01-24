part of flutter_core_image_filters;

mixin TextureMixin on CIFilterConfiguration {
  final DataParameter _texture =
      CIImageParameter('inputTexture', 'Texture');

  set texture(Uint8List value) {
    _texture.data = value;
    _texture.asset = null;
    _texture.file = null;
  }

  set textureAsset(String value) {
    _texture.data = null;
    _texture.asset = value;
    _texture.file = null;
  }

  set textureFile(File value) {
    _texture.data = null;
    _texture.asset = null;
    _texture.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _texture];
}
