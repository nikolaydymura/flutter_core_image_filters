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

@HostApi()
abstract class ImagePreviewApi {
  @ObjCSelector('create')
  int create();

  @ObjCSelector('connect: : :')
  void connect(int textureId, List<int?> filters, String context);

  @ObjCSelector('disconnect:')
  void disconnect(int textureId);

  @ObjCSelector('setSource: asset:')
  void setSourceAsset(int textureId, String path);

  @ObjCSelector('setSource: path:')
  void setSourceFile(int textureId, String path);

  @ObjCSelector('setSource: data:')
  void setData(int textureId, Uint8List data);

  @ObjCSelector('setOutput: :')
  void setOutput(int textureId, List<double?> value);

  @ObjCSelector('dispose:')
  void dispose(int textureId);
}

@HostApi()
abstract class VideoPreviewApi {
  @ObjCSelector('create')
  int create();

  @ObjCSelector('connect: : :')
  void connect(int textureId, List<int?> filters, String context);

  @ObjCSelector('disconnect:')
  void disconnect(int textureId);

  @ObjCSelector('setSource: asset:')
  void setSourceAsset(int textureId, String path);

  @ObjCSelector('setSource: path:')
  void setSourceFile(int textureId, String path);

  @ObjCSelector('resume:')
  void resume(int textureId);

  @ObjCSelector('pause:')
  void pause(int textureId);

  @ObjCSelector('dispose:')
  void dispose(int textureId);
}
