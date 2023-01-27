part of flutter_core_image_filters;

mixin MessageMixin on CIFilterConfiguration {
  final DataParameter _message = NSDataParameter(
    'inputMessage',
    'Message',
  );

  set messageData(Uint8List value) {
    _message.data = value;
    _message.asset = null;
    _message.file = null;
  }

  set messageAsset(String value) {
    _message.data = null;
    _message.asset = value;
    _message.file = null;
  }

  set messageFile(File value) {
    _message.data = null;
    _message.asset = null;
    _message.file = value;
  }

  // coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters =>
      [...super.parameters, _message];
// coverage:ignore-end
}
