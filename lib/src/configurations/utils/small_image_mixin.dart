part of flutter_core_image_filters;

mixin SmallImageMixin on CIFilterConfiguration {
  final DataParameter _smallImage =
      CIImageParameter('inputSmallImage', 'Small Image');

  set smallImage(Uint8List value) {
    _smallImage.data = value;
    _smallImage.asset = null;
    _smallImage.file = null;
  }

  set smallImageAsset(String value) {
    _smallImage.data = null;
    _smallImage.asset = value;
    _smallImage.file = null;
  }

  set smallImageFile(File value) {
    _smallImage.data = null;
    _smallImage.asset = null;
    _smallImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _smallImage];
}
