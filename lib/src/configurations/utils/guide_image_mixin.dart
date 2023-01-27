part of flutter_core_image_filters;

mixin GuideImageMixin on CIFilterConfiguration {
  final DataParameter _guideImage =
      CIImageParameter('inputGuideImage', 'A larger image to use as a guide.');

  set guideImage(Uint8List value) {
    _guideImage.data = value;
    _guideImage.asset = null;
    _guideImage.file = null;
  }

  set guideImageAsset(String value) {
    _guideImage.data = null;
    _guideImage.asset = value;
    _guideImage.file = null;
  }

  set guideImageFile(File value) {
    _guideImage.data = null;
    _guideImage.asset = null;
    _guideImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _guideImage];
// coverage:ignore-end
}
