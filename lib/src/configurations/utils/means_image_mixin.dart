part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a means image parameter to a filter configuration.
mixin MeansImageMixin on CIFilterConfiguration {
  final DataParameter _meansImage = CIImageParameter('inputMeans', 'Means');

  /// The means image data
  ///
  /// If this is set, [meansImageAsset] and [meansImageFile] will be null.
  set meansImage(Uint8List value) {
    _meansImage.data = value;
    _meansImage.asset = null;
    _meansImage.file = null;
  }

  /// The means image asset
  ///
  /// If this is set, [meansImage] and [meansImageFile] will be null.
  set meansImageAsset(String value) {
    _meansImage.data = null;
    _meansImage.asset = value;
    _meansImage.file = null;
  }

  /// The means image file
  ///
  /// If this is set, [meansImage] and [meansImageAsset] will be null.
  set meansImageFile(File value) {
    _meansImage.data = null;
    _meansImage.asset = null;
    _meansImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _meansImage,
  ];
  // coverage:ignore-end
}
