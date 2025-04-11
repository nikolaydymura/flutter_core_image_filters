part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a background image parameter to a filter configuration.
mixin BackgroundImageMixin on CIFilterConfiguration {
  final DataParameter _backgroundImage = CIImageParameter(
    'inputBackgroundImage',
    'Background Image',
  );

  /// The background image data
  ///
  /// If this is set, [backgroundImageAsset] and [backgroundImageFile] will be null.
  set backgroundImage(Uint8List value) {
    _backgroundImage.data = value;
    _backgroundImage.asset = null;
    _backgroundImage.file = null;
  }

  /// The background image asset
  ///
  /// If this is set, [backgroundImage] and [backgroundImageFile] will be null.
  set backgroundImageAsset(String value) {
    _backgroundImage.data = null;
    _backgroundImage.asset = value;
    _backgroundImage.file = null;
  }

  /// The background image file
  ///
  /// If this is set, [backgroundImage] and [backgroundImageAsset] will be null.
  set backgroundImageFile(File value) {
    _backgroundImage.data = null;
    _backgroundImage.asset = null;
    _backgroundImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _backgroundImage,
  ];
  // coverage:ignore-end
}
