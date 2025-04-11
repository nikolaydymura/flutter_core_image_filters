part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a palette image parameter to a filter configuration.
mixin PaletteImageMixin on CIFilterConfiguration {
  final DataParameter _paletteImage = CIImageParameter(
    'inputPaletteImage',
    'Palette Image',
  );

  /// The palette image data
  ///
  /// If this is set, [paletteImageAsset] and [paletteImageFile] will be null.
  set paletteImage(Uint8List value) {
    _paletteImage.data = value;
    _paletteImage.asset = null;
    _paletteImage.file = null;
  }

  /// The palette image asset
  ///
  /// If this is set, [paletteImage] and [paletteImageFile] will be null.
  set paletteImageAsset(String value) {
    _paletteImage.data = null;
    _paletteImage.asset = value;
    _paletteImage.file = null;
  }

  /// The palette image file
  ///
  /// If this is set, [paletteImage] and [paletteImageAsset] will be null.
  set paletteImageFile(File value) {
    _paletteImage.data = null;
    _paletteImage.asset = null;
    _paletteImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _paletteImage,
  ];
  // coverage:ignore-end
}
