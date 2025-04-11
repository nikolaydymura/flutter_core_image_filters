part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a shading image parameter to a filter configuration.
mixin ShadingImageMixin on CIFilterConfiguration {
  final DataParameter _shadingImage = CIImageParameter(
    'inputShadingImage',
    'Shading Image',
  );

  /// The shading image data
  ///
  /// If this is set, [shadingImageAsset] and [shadingImageFile] will be null.
  set shadingImage(Uint8List value) {
    _shadingImage.data = value;
    _shadingImage.asset = null;
    _shadingImage.file = null;
  }

  /// The shading image asset
  ///
  /// If this is set, [shadingImage] and [shadingImageFile] will be null.
  set shadingImageAsset(String value) {
    _shadingImage.data = null;
    _shadingImage.asset = value;
    _shadingImage.file = null;
  }

  /// The shading image file
  ///
  /// If this is set, [shadingImage] and [shadingImageAsset] will be null.
  set shadingImageFile(File value) {
    _shadingImage.data = null;
    _shadingImage.asset = null;
    _shadingImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _shadingImage,
  ];
  // coverage:ignore-end
}
