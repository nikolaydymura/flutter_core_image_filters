part of flutter_core_image_filters;

mixin MeansImageMixin on CIFilterConfiguration {
  final DataParameter _meansImage = CIImageParameter('inputMeans', 'Means');

  set meansImage(Uint8List value) {
    _meansImage.data = value;
    _meansImage.asset = null;
    _meansImage.file = null;
  }

  set meansImageAsset(String value) {
    _meansImage.data = null;
    _meansImage.asset = value;
    _meansImage.file = null;
  }

  set meansImageFile(File value) {
    _meansImage.data = null;
    _meansImage.asset = null;
    _meansImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _meansImage];
}
