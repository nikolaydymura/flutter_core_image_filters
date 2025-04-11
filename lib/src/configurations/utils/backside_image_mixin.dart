part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a backside image parameter to a filter configuration.
mixin BacksideImageMixin on CIFilterConfiguration {
  final DataParameter _backsideImage = CIImageParameter(
    'inputBacksideImage',
    'Backside Image',
  );

  /// The backside image data
  ///
  /// If this is set, [backsideImageAsset] and [backsideImageFile] will be null.
  set backsideImage(Uint8List value) {
    _backsideImage.data = value;
    _backsideImage.asset = null;
    _backsideImage.file = null;
  }

  /// The backside image asset
  ///
  /// If this is set, [backsideImage] and [backsideImageFile] will be null.
  set backsideImageAsset(String value) {
    _backsideImage.data = null;
    _backsideImage.asset = value;
    _backsideImage.file = null;
  }

  /// The backside image file
  ///
  /// If this is set, [backsideImage] and [backsideImageAsset] will be null.
  set backsideImageFile(File value) {
    _backsideImage.data = null;
    _backsideImage.asset = null;
    _backsideImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _backsideImage,
  ];
  // coverage:ignore-end
}
