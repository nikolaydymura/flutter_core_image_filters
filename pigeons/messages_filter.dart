// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages/filter_messages.g.dart',
    swiftOut: 'ios/Classes/FilterMessages.g.swift',
    swiftOptions: SwiftOptions(),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)

@HostApi()
abstract class FilterApi {
  @SwiftFunction('createFilter(_:)')
  int create(String name);

  @SwiftFunction('exportData(_:_:_:_:)')
  Uint8List exportData(List<int> filters, String format, String context, List<double>? value);

  @SwiftFunction('exportImageFile(_:_:_:_:_:)')
  void exportImageFile(List<int> filters, String path, String format, String context, List<double>? value);

  @SwiftFunction('exportVideoFile(_:_:_:_:_:_:_:_:)')
  int exportVideoFile(List<int> filters, bool asset, String input, String output, String format, String context, String preset, double period);

  @SwiftFunction('setInputData(_:_:)')
  void setInputData(int filterId, Uint8List data);

  @SwiftFunction('setInputAsset(_:_:)')
  void setInputAsset(int filterId, String path);

  @SwiftFunction('setInputFile(_:_:)')
  void setInputFile(int filterId, String path);

  @SwiftFunction('setNSNumberParameter(_:_:_:)')
  void setNSNumberParameter(int filterId, String key, double value);

  @SwiftFunction('setCIColorParameter(_:_:_:)')
  void setCIColorParameter(int filterId, String key, List<double> value);

  @SwiftFunction('setNSValueParameter(_:_:_:)')
  void setNSValueParameter(int filterId, String key, List<double> value);

  @SwiftFunction('setCIVectorParameter(_:_:_:)')
  void setCIVectorParameter(int filterId, String key, List<double> value);

  @SwiftFunction('setCIImageDataParameter(_:_:_:)')
  void setCIImageDataParameter(int filterId, String key, Uint8List data);

  @SwiftFunction('setCIImageSourceParameter(_:_:_:_:)')
  void setCIImageSourceParameter(int filterId, String key, bool asset, String path);

  @SwiftFunction('setCIImageCubeDataParameter(_:_:_:_:_:_:)')
  void setCIImageCubeDataParameter(int filterId, String key, Uint8List data, int size, int columns, int rows);

  @SwiftFunction('setCIImageCubeSourceParameter(_:_:_:_:_:_:_:)')
  void setCIImageCubeSourceParameter(int filterId, String key, bool asset, String path, int size, int columns, int rows);

  @SwiftFunction('setNSDataParameter(_:_:_:)')
  void setNSDataParameter(int filterId, String key, Uint8List data);

  @SwiftFunction('setNSDataSourceParameter(_:_:_:_:)')
  void setNSDataSourceParameter(int filterId,String key, bool asset, String path);

  @SwiftFunction('setNSStringParameter(_:_:_:)')
  void setNSStringParameter(int filterId, String key, String value);

  @SwiftFunction('disposeFilter(_:)')
  void dispose(int filterId);
}
