part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a target image parameter to a filter configuration.
mixin TargetImageMixin on CIFilterConfiguration {
  final DataParameter _targetImage =
      CIImageParameter('inputTargetImage', 'Target Image');

  /// The target image data
  ///
  /// If this is set, [targetImageAsset] and [targetImageFile] will be null.
  set targetImage(Uint8List value) {
    _targetImage.data = value;
    _targetImage.asset = null;
    _targetImage.file = null;
  }

  /// The target image asset
  ///
  /// If this is set, [targetImage] and [targetImageFile] will be null.
  set targetImageAsset(String value) {
    _targetImage.data = null;
    _targetImage.asset = value;
    _targetImage.file = null;
  }

  /// The target image file
  ///
  /// If this is set, [targetImage] and [targetImageAsset] will be null.
  set targetImageFile(File value) {
    _targetImage.data = null;
    _targetImage.asset = null;
    _targetImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _targetImage];
// coverage:ignore-end
}
