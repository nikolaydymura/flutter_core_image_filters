part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a small image parameter to a filter configuration.
mixin SmallImageMixin on CIFilterConfiguration {
  final DataParameter _smallImage = CIImageParameter(
    'inputSmallImage',
    'Small Image',
  );

  /// The small image data
  ///
  /// If this is set, [smallImageAsset] and [smallImageFile] will be null.
  set smallImage(Uint8List value) {
    _smallImage.data = value;
    _smallImage.asset = null;
    _smallImage.file = null;
  }

  /// The small image asset
  ///
  /// If this is set, [smallImage] and [smallImageFile] will be null.
  set smallImageAsset(String value) {
    _smallImage.data = null;
    _smallImage.asset = value;
    _smallImage.file = null;
  }

  /// The small image file
  ///
  /// If this is set, [smallImage] and [smallImageAsset] will be null.
  set smallImageFile(File value) {
    _smallImage.data = null;
    _smallImage.asset = null;
    _smallImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _smallImage,
  ];
  // coverage:ignore-end
}
