// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages/preview_messages.g.dart',
    swiftOut: 'ios/Classes/PreviewMessages.g.swift',
    swiftOptions: SwiftOptions(),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
@HostApi()
abstract class ImagePreviewApi {
  @SwiftFunction('create()')
  int create();

  @SwiftFunction('connect(_:_:_:)')
  void connect(int textureId, List<int> filters, String context);

  @SwiftFunction('disconnect(_:)')
  void disconnect(int textureId);

  @SwiftFunction('setSource(_:asset:)')
  void setSourceAsset(int textureId, String path);

  @SwiftFunction('setSource(_:path:)')
  void setSourceFile(int textureId, String path);

  @SwiftFunction('setSource(_:data:)')
  void setData(int textureId, Uint8List data);

  @SwiftFunction('setOutput(_:_:)')
  void setOutput(int textureId, List<double> value);

  @SwiftFunction('dispose(_:)')
  void dispose(int textureId);
}

@HostApi()
abstract class VideoPreviewApi {
  @SwiftFunction('create()')
  int create();

  @SwiftFunction('connect(_:_:_:)')
  void connect(int textureId, List<int> filters, String context);

  @SwiftFunction('disconnect(_:)')
  void disconnect(int textureId);

  @SwiftFunction('setSource(_:asset:)')
  void setSourceAsset(int textureId, String path);

  @SwiftFunction('setSource(_:path:)')
  void setSourceFile(int textureId, String path);

  @SwiftFunction('resume(_:)')
  void resume(int textureId);

  @SwiftFunction('pause(_:)')
  void pause(int textureId);

  @SwiftFunction('dispose(_:)')
  void dispose(int textureId);
}
