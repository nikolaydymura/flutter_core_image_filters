part of flutter_core_image_filters;

mixin DisplacementImageMixin on CIFilterConfiguration {
  final DataParameter _displacementImage =
      CIImageParameter('inputDisplacementImage', 'Displacement Image');

  set displacementImage(Uint8List value) {
    _displacementImage.data = value;
    _displacementImage.asset = null;
    _displacementImage.file = null;
  }

  set displacementImageAsset(String value) {
    _displacementImage.data = null;
    _displacementImage.asset = value;
    _displacementImage.file = null;
  }

  set displacementImageFile(File value) {
    _displacementImage.data = null;
    _displacementImage.asset = null;
    _displacementImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _displacementImage];
}
