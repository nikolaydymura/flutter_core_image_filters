import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../parameters/ci_color_parameter.dart';
import 'ci_filter_configuration.dart';

class CIWhitePointAdjustConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;

  CIWhitePointAdjustConfiguration()
      : _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(1, 1, 1, 1.0),
        ),
        super('CIWhitePointAdjust');

  set color(Color value) {
    _color.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_color];
}
