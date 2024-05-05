part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a displacement image parameter to a filter configuration.
mixin DisplacementImageMixin on CIFilterConfiguration {
  final DataParameter _displacementImage =
      CIImageParameter('inputDisplacementImage', 'Displacement Image');

  /// The displacement image data
  ///
  /// If this is set, [displacementImageAsset] and [displacementImageFile] will be null.
  set displacementImage(Uint8List value) {
    _displacementImage.data = value;
    _displacementImage.asset = null;
    _displacementImage.file = null;
  }

  /// The displacement image asset
  ///
  /// If this is set, [displacementImage] and [displacementImageFile] will be null.
  set displacementImageAsset(String value) {
    _displacementImage.data = null;
    _displacementImage.asset = value;
    _displacementImage.file = null;
  }

  /// The displacement image file
  ///
  /// If this is set, [displacementImage] and [displacementImageAsset] will be null.
  set displacementImageFile(File value) {
    _displacementImage.data = null;
    _displacementImage.asset = null;
    _displacementImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _displacementImage];
// coverage:ignore-end
}
