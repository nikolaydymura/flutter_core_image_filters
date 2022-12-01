// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages/filter_messages.g.dart',
    objcHeaderOut: 'ios/Classes/FilterMessages.g.h',
    objcSourceOut: 'ios/Classes/FilterMessages.g.m',
    objcOptions: ObjcOptions(
      prefix: 'FLT',
    ),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)

@HostApi()
abstract class FilterApi {
  @ObjCSelector('createFilter:')
  int create(String name);

  @ObjCSelector('setInputData: :')
  void setInputData(int filterId, Uint8List data);

  @ObjCSelector('setInputAsset: :')
  void setInputSource(int filterId, String path);

  @ObjCSelector('setInputFile: :')
  void setInputFile(int filterId, String path);

  @ObjCSelector('setNSNumberParameter: : :')
  void setNSNumberParameter(int filterId, String key, double value);

  @ObjCSelector('setCIColorParameter: : :')
  void setCIColorParameter(int filterId, String key, List<double?> value);

  @ObjCSelector('setCIVectorParameter: : :')
  void setCIVectorParameter(int filterId, String key, List<double?> value);

  @ObjCSelector('setCIImageDataParameter: : :')
  void setCIImageDataParameter(int filterId, String key, Uint8List data);

  @ObjCSelector('setCIImageSourceParameter: : : :')
  void setCIImageSourceParameter(int filterId, String key, bool asset, String path);

  @ObjCSelector('setNSDataParameter: : :')
  void setNSDataParameter(int filterId, String key, Uint8List data);

  @ObjCSelector('setNSDataSourceParameter: : : :')
  void setNSDataSourceParameter(int filterId,String key, bool asset, String path);

  @ObjCSelector('disposeFilter:')
  void dispose(int filterId);
}
