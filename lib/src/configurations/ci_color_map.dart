part of flutter_core_image_filters;

class CIColorMapConfiguration extends CIFilterConfiguration {
  final DataParameter _gradientImage;

  CIColorMapConfiguration()
      : _gradientImage =
            CIImageParameter('inputGradientImage', 'Gradient Image'),
        super('CIColorMap');

  set gradientImage(Uint8List value) {
    _gradientImage.data = value;
    _gradientImage.asset = null;
    _gradientImage.file = null;
  }

  set gradientImageAsset(String value) {
    _gradientImage.data = null;
    _gradientImage.asset = value;
    _gradientImage.file = null;
  }

  set gradientImageFile(File value) {
    _gradientImage.data = null;
    _gradientImage.asset = null;
    _gradientImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_gradientImage];
}
