part of flutter_core_image_filters;

class CIColorAbsoluteDifferenceConfiguration extends CIFilterConfiguration {
  final DataParameter _image2;

  CIColorAbsoluteDifferenceConfiguration()
      : _image2 = CIImageParameter('inputImage2', 'Image 2'),
        super('CIColorAbsoluteDifference');

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
  List<ConfigurationParameter> get parameters => [_image2];
}
