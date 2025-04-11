part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a guide image parameter to a filter configuration.
mixin GuideImageMixin on CIFilterConfiguration {
  final DataParameter _guideImage = CIImageParameter(
    'inputGuideImage',
    'A larger image to use as a guide.',
  );

  /// The guide image data
  ///
  /// If this is set, [guideImageAsset] and [guideImageFile] will be null.
  set guideImage(Uint8List value) {
    _guideImage.data = value;
    _guideImage.asset = null;
    _guideImage.file = null;
  }

  /// The guide image asset
  ///
  /// If this is set, [guideImage] and [guideImageFile] will be null.
  set guideImageAsset(String value) {
    _guideImage.data = null;
    _guideImage.asset = value;
    _guideImage.file = null;
  }

  /// The guide image file
  ///
  /// If this is set, [guideImage] and [guideImageAsset] will be null.
  set guideImageFile(File value) {
    _guideImage.data = null;
    _guideImage.asset = null;
    _guideImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _guideImage,
  ];
  // coverage:ignore-end
}
