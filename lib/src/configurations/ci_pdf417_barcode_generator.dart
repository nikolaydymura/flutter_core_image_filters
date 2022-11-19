import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIPDF417BarcodeGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _minHeight;
  final NumberParameter _alwaysSpecifyCompaction;
  final NumberParameter _dataColumns;
  final NumberParameter _minWidth;
  final NumberParameter _maxWidth;
  final NumberParameter _correctionLevel;
  final NumberParameter _compactionMode;
  final NumberParameter _rows;
  final NumberParameter _compactStyle;
  final NumberParameter _preferredAspectRatio;
  final NumberParameter _maxHeight;

  CIPDF417BarcodeGeneratorConfiguration()
      : _minHeight = SliderNSNumberParameter(
          'inputMinHeight',
          'MinHeight',
          13,
          min: 13,
          max: 283,
        ),
        _alwaysSpecifyCompaction = SliderNSNumberParameter(
          'inputAlwaysSpecifyCompaction',
          'AlwaysSpecifyCompaction',
          0,
          min: 0,
          max: 1,
        ),
        _dataColumns = SliderNSNumberParameter(
          'inputDataColumns',
          'DataColumns',
          0,
          min: 0,
          max: 1,
        ),
        _minWidth = SliderNSNumberParameter(
          'inputMinWidth',
          'MinWidth',
          56,
          min: 56,
          max: 583,
        ),
        _maxWidth = SliderNSNumberParameter(
          'inputMaxWidth',
          'MaxWidth',
          56,
          min: 56,
          max: 583,
        ),
        _correctionLevel = SliderNSNumberParameter(
          'inputCorrectionLevel',
          'CorrectionLevel',
          0,
          min: 0,
          max: 8,
        ),
        _compactionMode = SliderNSNumberParameter(
          'inputCompactionMode',
          'CompactionMode',
          0,
          min: 0,
          max: 3,
        ),
        _rows = SliderNSNumberParameter(
          'inputRows',
          'Rows',
          3,
          min: 3,
          max: 90,
        ),
        _compactStyle = SliderNSNumberParameter(
          'inputCompactStyle',
          'compactStyle',
          0,
          min: 0,
          max: 1,
        ),
        _preferredAspectRatio = SliderNSNumberParameter(
          'inputPreferredAspectRatio',
          'PreferredAspectRatio',
          0,
          min: 0,
          max: double.maxFinite,
        ),
        _maxHeight = SliderNSNumberParameter(
          'inputMaxHeight',
          'MaxHeight',
          13,
          min: 13,
          max: 283,
        ),
        super('CIPDF417BarcodeGenerator');

  set minHeight(double value) {
    _minHeight.value = value;
  }

  set alwaysSpecifyCompaction(double value) {
    _alwaysSpecifyCompaction.value = value;
  }

  set dataColumns(double value) {
    _dataColumns.value = value;
  }

  set minWidth(double value) {
    _minWidth.value = value;
  }

  set maxWidth(double value) {
    _maxWidth.value = value;
  }

  set correctionLevel(double value) {
    _correctionLevel.value = value;
  }

  set compactionMode(double value) {
    _compactionMode.value = value;
  }

  set rows(double value) {
    _rows.value = value;
  }

  set compactStyle(double value) {
    _compactStyle.value = value;
  }

  set preferredAspectRatio(double value) {
    _preferredAspectRatio.value = value;
  }

  set maxHeight(double value) {
    _maxHeight.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [
        _minHeight,
        _alwaysSpecifyCompaction,
        _dataColumns,
        _minWidth,
        _maxWidth,
        _correctionLevel,
        _compactionMode,
        _rows,
        _compactStyle,
        _preferredAspectRatio,
        _maxHeight
      ];
}
