part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a gradient image parameter to a filter configuration.
mixin GradientImageMixin on CIFilterConfiguration {
  final DataParameter _gradientImage = CIImageParameter(
    'inputGradientImage',
    'Gradient Image',
  );

  /// The gradient image data
  ///
  /// If this is set, [gradientImageAsset] and [gradientImageFile] will be null.
  set gradientImage(Uint8List value) {
    _gradientImage.data = value;
    _gradientImage.asset = null;
    _gradientImage.file = null;
  }

  /// The gradient image asset
  ///
  /// If this is set, [gradientImage] and [gradientImageFile] will be null.
  set gradientImageAsset(String value) {
    _gradientImage.data = null;
    _gradientImage.asset = value;
    _gradientImage.file = null;
  }

  /// The gradient image file
  ///
  /// If this is set, [gradientImage] and [gradientImageAsset] will be null.
  set gradientImageFile(File value) {
    _gradientImage.data = null;
    _gradientImage.asset = null;
    _gradientImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [
    ...super.parameters,
    _gradientImage,
  ];
  // coverage:ignore-end
}
