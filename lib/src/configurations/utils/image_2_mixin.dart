part of flutter_core_image_filters;

mixin Image2Mixin on CIFilterConfiguration {
  final DataParameter _image2 = CIImageParameter('inputImage2', 'Image2');

  set image2(Uint8List value) {
    _image2.data = value;
    _image2.asset = null;
    _image2.file = null;
  }

  set image2Asset(String value) {
    _image2.data = null;
    _image2.asset = value;
    _image2.file = null;
  }

  set image2File(File value) {
    _image2.data = null;
    _image2.asset = null;
    _image2.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [...super.parameters, _image2];
}
