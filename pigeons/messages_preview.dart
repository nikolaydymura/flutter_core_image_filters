// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages/preview_messages.g.dart',
    objcHeaderOut: 'ios/Classes/PreviewMessages.g.h',
    objcSourceOut: 'ios/Classes/PreviewMessages.g.m',
    objcOptions: ObjcOptions(
      prefix: 'FLT',
    ),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
class BindPreviewMessage {
  BindPreviewMessage(this.textureId, this.filterId);

  int textureId;
  int filterId;
}

class SourcePreviewMessage {
  SourcePreviewMessage(this.textureId, this.path, this.asset);

  int textureId;
  String path;
  bool asset;
}

class DataPreviewMessage {
  DataPreviewMessage(this.textureId, this.data);

  int textureId;
  Uint8List data;
}

@HostApi()
abstract class ImagePreviewApi {
  @ObjCSelector('create')
  int create();

  @ObjCSelector('connect: :')
  void connect(int textureId, int filterId);

  @ObjCSelector('disconnect:')
  void disconnect(int textureId);

  @ObjCSelector('setSource:')
  void setSource(SourcePreviewMessage msg);

  @ObjCSelector('setData:')
  void setData(DataPreviewMessage msg);

  @ObjCSelector('dispose:')
  void dispose(int textureId);
}

@HostApi()
abstract class VideoPreviewApi {
  @ObjCSelector('create')
  int create();

  @ObjCSelector('connect: :')
  void connect(int textureId, int filterId);

  @ObjCSelector('disconnect:')
  void disconnect(int textureId);

  @ObjCSelector('setSource:')
  void setSource(SourcePreviewMessage msg);

  @ObjCSelector('resume:')
  void resume(int textureId);

  @ObjCSelector('pause:')
  void pause(int textureId);

  @ObjCSelector('dispose:')
  void dispose(int textureId);
}
