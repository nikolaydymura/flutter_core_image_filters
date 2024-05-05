part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a texture parameter to a filter configuration.
mixin TextureMixin on CIFilterConfiguration {
  final DataParameter _texture = CIImageParameter('inputTexture', 'Texture');

  /// The texture data
  ///
  /// If this is set, [textureAsset] and [textureFile] will be null.
  set texture(Uint8List value) {
    _texture.data = value;
    _texture.asset = null;
    _texture.file = null;
  }

  /// The texture asset
  ///
  /// If this is set, [texture] and [textureFile] will be null.
  set textureAsset(String value) {
    _texture.data = null;
    _texture.asset = value;
    _texture.file = null;
  }

  /// The texture file
  ///
  /// If this is set, [texture] and [textureAsset] will be null.
  set textureFile(File value) {
    _texture.data = null;
    _texture.asset = null;
    _texture.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _texture];
// coverage:ignore-end
}
