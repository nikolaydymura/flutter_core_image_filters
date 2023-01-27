part of flutter_core_image_filters;

mixin TargetImageMixin on CIFilterConfiguration {
  final DataParameter _targetImage =
      CIImageParameter('inputTargetImage', 'Target Image');

  set targetImage(Uint8List value) {
    _targetImage.data = value;
    _targetImage.asset = null;
    _targetImage.file = null;
  }

  set targetImageAsset(String value) {
    _targetImage.data = null;
    _targetImage.asset = value;
    _targetImage.file = null;
  }

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
