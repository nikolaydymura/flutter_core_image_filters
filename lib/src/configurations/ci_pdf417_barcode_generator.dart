part of '../../flutter_core_image_filters.dart';

class CIPDF417BarcodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final NumberParameter _minHeight;
  final BoolParameter _alwaysSpecifyCompaction;
  final NumberParameter _dataColumns;
  final NumberParameter _minWidth;
  final NumberParameter _maxWidth;
  final NumberParameter _correctionLevel;
  final NumberParameter _compactionMode;
  final NumberParameter _rows;
  final BoolParameter _compactStyle;
  final NumberParameter _preferredAspectRatio;
  final NumberParameter _maxHeight;

  CIPDF417BarcodeGeneratorConfiguration()
      : _minHeight = SliderNSIntegerParameter(
          'inputMinHeight',
          'Min Height',
          double.nan,
          min: 13,
          max: 283,
        ),
        _alwaysSpecifyCompaction = NSBoolParameter(
          'inputAlwaysSpecifyCompaction',
          'Always Specify Compaction',
          false,
        ),
        _dataColumns = SliderNSIntegerParameter(
          'inputDataColumns',
          'Data Columns',
          double.nan,
          min: 1,
          max: 30,
        ),
        _minWidth = SliderNSIntegerParameter(
          'inputMinWidth',
          'Min Width',
          double.nan,
          min: 56,
          max: 583,
        ),
        _maxWidth = SliderNSIntegerParameter(
          'inputMaxWidth',
          'Max Width',
          double.nan,
          min: 56,
          max: 583,
        ),
        _correctionLevel = SliderNSIntegerParameter(
          'inputCorrectionLevel',
          'Correction Level',
          double.nan,
          min: 0,
          max: 8,
        ),
        _compactionMode = SliderNSIntegerParameter(
          'inputCompactionMode',
          'Compaction Mode',
          double.nan,
          min: 0,
          max: 3,
        ),
        _rows = SliderNSIntegerParameter(
          'inputRows',
          'Rows',
          double.nan,
          min: 3,
          max: 90,
        ),
        _compactStyle = NSBoolParameter(
          'inputCompactStyle',
          'Compact Style',
          false,
        ),
        _preferredAspectRatio = SliderNSNumberParameter(
          'inputPreferredAspectRatio',
          'Preferred Aspect Ratio',
          double.nan,
          min: 0,
          max: 9223372036854776000.0,
        ),
        _maxHeight = SliderNSIntegerParameter(
          'inputMaxHeight',
          'Max Height',
          double.nan,
          min: 13,
          max: 283,
        ),
        super('CIPDF417BarcodeGenerator');

  set minHeight(int value) {
    _minHeight.value = value;
  }

  set alwaysSpecifyCompaction(bool value) {
    _alwaysSpecifyCompaction.value = value;
  }

  set dataColumns(int value) {
    _dataColumns.value = value;
  }

  set minWidth(int value) {
    _minWidth.value = value;
  }

  set maxWidth(int value) {
    _maxWidth.value = value;
  }

  set correctionLevel(int value) {
    _correctionLevel.value = value;
  }

  set compactionMode(int value) {
    _compactionMode.value = value;
  }

  set rows(int value) {
    _rows.value = value;
  }

  set compactStyle(bool value) {
    _compactStyle.value = value;
  }

  set preferredAspectRatio(double value) {
    _preferredAspectRatio.value = value;
  }

  set maxHeight(double value) {
    _maxHeight.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

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
        _maxHeight,
        _message,
      ];

  @override
  bool get hasInputImage => false;
}
