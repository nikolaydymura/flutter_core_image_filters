part of '../../../flutter_core_image_filters.dart';

/// A mixin that provides a message parameter to a filter configuration.
mixin MessageMixin on CIFilterConfiguration {
  final DataParameter _message = NSDataParameter(
    'inputMessage',
    'Message',
  );

  /// The message data
  ///
  /// If this is set, [messageAsset] and [messageFile] will be null.
  set messageData(Uint8List value) {
    _message.data = value;
    _message.asset = null;
    _message.file = null;
  }

  /// The message asset
  ///
  /// If this is set, [messageData] and [messageFile] will be null.
  set messageAsset(String value) {
    _message.data = null;
    _message.asset = value;
    _message.file = null;
  }

  /// The message file
  ///
  /// If this is set, [messageData] and [messageAsset] will be null.
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
