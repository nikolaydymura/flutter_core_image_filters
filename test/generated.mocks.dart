// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_core_image_filters/example/ios/.symlinks/plugins/flutter_core_image_filters/example/macos/Flutter/ephemeral/.symlinks/plugins/flutter_core_image_filters/test/generated.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:flutter_core_image_filters/src/messages/filter_messages.g.dart'
    as _i2;
import 'package:flutter_core_image_filters/src/messages/preview_messages.g.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FilterApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilterApi extends _i1.Mock implements _i2.FilterApi {
  MockFilterApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> create(String? arg_name) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [arg_name],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<_i4.Uint8List> exportData(
    int? arg_filterId,
    String? arg_format,
    String? arg_context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #exportData,
          [
            arg_filterId,
            arg_format,
            arg_context,
          ],
        ),
        returnValue: _i3.Future<_i4.Uint8List>.value(_i4.Uint8List(0)),
      ) as _i3.Future<_i4.Uint8List>);
  @override
  _i3.Future<void> exportImageFile(
    int? arg_filterId,
    String? arg_path,
    String? arg_format,
    String? arg_context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #exportImageFile,
          [
            arg_filterId,
            arg_path,
            arg_format,
            arg_context,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<int> exportVideoFile(
    int? arg_filterId,
    bool? arg_asset,
    String? arg_input,
    String? arg_output,
    String? arg_format,
    String? arg_context,
    String? arg_preset,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #exportVideoFile,
          [
            arg_filterId,
            arg_asset,
            arg_input,
            arg_output,
            arg_format,
            arg_context,
            arg_preset,
          ],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<void> setInputData(
    int? arg_filterId,
    _i4.Uint8List? arg_data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInputData,
          [
            arg_filterId,
            arg_data,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setInputAsset(
    int? arg_filterId,
    String? arg_path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInputAsset,
          [
            arg_filterId,
            arg_path,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setInputFile(
    int? arg_filterId,
    String? arg_path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInputFile,
          [
            arg_filterId,
            arg_path,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setNSNumberParameter(
    int? arg_filterId,
    String? arg_key,
    double? arg_value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNSNumberParameter,
          [
            arg_filterId,
            arg_key,
            arg_value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setCIColorParameter(
    int? arg_filterId,
    String? arg_key,
    List<double?>? arg_value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCIColorParameter,
          [
            arg_filterId,
            arg_key,
            arg_value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setNSValueParameter(
    int? arg_filterId,
    String? arg_key,
    List<double?>? arg_value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNSValueParameter,
          [
            arg_filterId,
            arg_key,
            arg_value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setCIVectorParameter(
    int? arg_filterId,
    String? arg_key,
    List<double?>? arg_value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCIVectorParameter,
          [
            arg_filterId,
            arg_key,
            arg_value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setCIImageDataParameter(
    int? arg_filterId,
    String? arg_key,
    _i4.Uint8List? arg_data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCIImageDataParameter,
          [
            arg_filterId,
            arg_key,
            arg_data,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setCIImageSourceParameter(
    int? arg_filterId,
    String? arg_key,
    bool? arg_asset,
    String? arg_path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCIImageSourceParameter,
          [
            arg_filterId,
            arg_key,
            arg_asset,
            arg_path,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setNSDataParameter(
    int? arg_filterId,
    String? arg_key,
    _i4.Uint8List? arg_data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNSDataParameter,
          [
            arg_filterId,
            arg_key,
            arg_data,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setNSDataSourceParameter(
    int? arg_filterId,
    String? arg_key,
    bool? arg_asset,
    String? arg_path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNSDataSourceParameter,
          [
            arg_filterId,
            arg_key,
            arg_asset,
            arg_path,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> dispose(int? arg_filterId) => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [arg_filterId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [ImagePreviewApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePreviewApi extends _i1.Mock implements _i5.ImagePreviewApi {
  MockImagePreviewApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> create() => (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<void> connect(
    int? arg_textureId,
    int? arg_filterId,
    String? arg_context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #connect,
          [
            arg_textureId,
            arg_filterId,
            arg_context,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> disconnect(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSource(_i5.SourcePreviewMessage? arg_msg) =>
      (super.noSuchMethod(
        Invocation.method(
          #setSource,
          [arg_msg],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setData(_i5.DataPreviewMessage? arg_msg) =>
      (super.noSuchMethod(
        Invocation.method(
          #setData,
          [arg_msg],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setOutput(
    int? arg_textureId,
    List<double?>? arg_value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setOutput,
          [
            arg_textureId,
            arg_value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> dispose(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [VideoPreviewApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockVideoPreviewApi extends _i1.Mock implements _i5.VideoPreviewApi {
  MockVideoPreviewApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> create() => (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<void> connect(
    int? arg_textureId,
    int? arg_filterId,
    String? arg_context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #connect,
          [
            arg_textureId,
            arg_filterId,
            arg_context,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> disconnect(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> setSource(_i5.SourcePreviewMessage? arg_msg) =>
      (super.noSuchMethod(
        Invocation.method(
          #setSource,
          [arg_msg],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> resume(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #resume,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> pause(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #pause,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> dispose(int? arg_textureId) => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [arg_textureId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
