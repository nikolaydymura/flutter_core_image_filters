part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a mask image parameter to a filter configuration.
mixin MaskImageMixin on CIFilterConfiguration {
  late final DataParameter _maskImage =
      CIImageParameter(_maskImageInputKey, _maskImageInputName);
  String get _maskImageInputKey => 'inputMaskImage';
  String get _maskImageInputName => 'Mask Image';

  /// The mask image data
  ///
  /// If this is set, [maskImageAsset] and [maskImageFile] will be null.
  set maskImage(Uint8List value) {
    _maskImage.data = value;
    _maskImage.asset = null;
    _maskImage.file = null;
  }

  /// The mask image asset
  ///
  /// If this is set, [maskImage] and [maskImageFile] will be null.
  set maskImageAsset(String value) {
    _maskImage.data = null;
    _maskImage.asset = value;
    _maskImage.file = null;
  }

  /// The mask image file
  ///
  /// If this is set, [maskImage] and [maskImageAsset] will be null.
  set maskImageFile(File value) {
    _maskImage.data = null;
    _maskImage.asset = null;
    _maskImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _maskImage];
// coverage:ignore-end
}
