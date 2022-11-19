import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../parameters/ci_color_parameter.dart';
import 'ci_filter_configuration.dart';

class CIConstantColorGeneratorConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;

  CIConstantColorGeneratorConfiguration()
      : _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(1, 0, 0, 1.0),
        ),
        super('CIConstantColorGenerator');

  set color(Color value) {
    _color.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_color];
}
