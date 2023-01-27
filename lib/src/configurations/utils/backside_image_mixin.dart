part of flutter_core_image_filters;

mixin BacksideImageMixin on CIFilterConfiguration {
  final DataParameter _backsideImage =
      CIImageParameter('inputBacksideImage', 'Backside Image');

  set backsideImage(Uint8List value) {
    _backsideImage.data = value;
    _backsideImage.asset = null;
    _backsideImage.file = null;
  }

  set backsideImageAsset(String value) {
    _backsideImage.data = null;
    _backsideImage.asset = value;
    _backsideImage.file = null;
  }

  set backsideImageFile(File value) {
    _backsideImage.data = null;
    _backsideImage.asset = null;
    _backsideImage.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _backsideImage];
// coverage:ignore-end
}
