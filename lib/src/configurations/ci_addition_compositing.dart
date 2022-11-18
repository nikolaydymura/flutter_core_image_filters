part of flutter_core_image_filters;

class CIAdditionCompositingConfiguration extends CIFilterConfiguration {
  final DataParameter _backgroundImage;

  CIAdditionCompositingConfiguration()
      : _backgroundImage = CIImageParameter('inputBackgroundImage', 'Background Image'),
        super('CIAdditionCompositing');

  set backgroundImage(Uint8List value) {
    _backgroundImage.data = value;
    _backgroundImage.asset = null;
    _backgroundImage.file = null;
  }

  set backgroundImageAsset(String value) {
    _backgroundImage.data = null;
    _backgroundImage.asset = value;
    _backgroundImage.file = null;
  }

  set backgroundImageFile(File value) {
    _backgroundImage.data = null;
    _backgroundImage.asset = null;
    _backgroundImage.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_backgroundImage];
}
