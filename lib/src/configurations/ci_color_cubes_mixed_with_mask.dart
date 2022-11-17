import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../parameters/ns_data_parameter.dart';
import '../parameters/ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIColorCubesMixedWithMaskConfiguration extends CIFilterConfiguration {
  final NumberParameter _cubeDimension;
  final DataParameter _cubeData;

  CIColorCubesMixedWithMaskConfiguration()
      : _cubeDimension =
            NSNumberParameter('inputCubeDimension', 'Cube Dimension', 2),
        _cubeData = NSDataParameter('inputCubeData', 'Cube Data'),
        super('CIColorCubesMixedWithMask');

  set cubeDimension(int value) {
    _cubeDimension.value = value;
  }

  set cubeData(Uint8List value) {
    _cubeData.data = value;
    _cubeData.asset = null;
    _cubeData.file = null;
  }

  set cubeDataAsset(String value) {
    _cubeData.data = null;
    _cubeData.asset = value;
    _cubeData.file = null;
  }

  set cubeDataFile(File value) {
    _cubeData.data = null;
    _cubeData.asset = null;
    _cubeData.file = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_cubeDimension, _cubeData];
}
