part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a second image parameter to a filter configuration.
mixin Image2Mixin on CIFilterConfiguration {
  final DataParameter _image2 = CIImageParameter('inputImage2', 'Image2');

  /// The image data
  ///
  /// If this is set, [image2Asset] and [image2File] will be null.
  set image2(Uint8List value) {
    _image2.data = value;
    _image2.asset = null;
    _image2.file = null;
  }

  /// The image asset
  ///
  /// If this is set, [image2] and [image2File] will be null.
  set image2Asset(String value) {
    _image2.data = null;
    _image2.asset = value;
    _image2.file = null;
  }

  /// The image file
  ///
  /// If this is set, [image2] and [image2Asset] will be null.
  set image2File(File value) {
    _image2.data = null;
    _image2.asset = null;
    _image2.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [...super.parameters, _image2];
  // coverage:ignore-end
}
