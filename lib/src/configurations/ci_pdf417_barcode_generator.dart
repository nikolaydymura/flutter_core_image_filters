part of flutter_core_image_filters;

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
      : _minHeight = SliderNSNumberParameter(
          'inputMinHeight',
          'Min Height',
          13,
          min: 13,
          max: 283,
        ),
        _alwaysSpecifyCompaction = NSBoolParameter(
          'inputAlwaysSpecifyCompaction',
          'Always Specify Compaction',
          false,
        ),
        _dataColumns = SliderNSNumberParameter(
          'inputDataColumns',
          'Data Columns',
          0,
          min: 0,
          max: 1,
        ),
        _minWidth = SliderNSNumberParameter(
          'inputMinWidth',
          'Min Width',
          56,
          min: 56,
          max: 583,
        ),
        _maxWidth = SliderNSNumberParameter(
          'inputMaxWidth',
          'Max Width',
          56,
          min: 56,
          max: 583,
        ),
        _correctionLevel = SliderNSNumberParameter(
          'inputCorrectionLevel',
          'Correction Level',
          0,
          min: 0,
          max: 8,
        ),
        _compactionMode = SliderNSNumberParameter(
          'inputCompactionMode',
          'Compaction Mode',
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
        _compactStyle = NSBoolParameter(
          'inputCompactStyle',
          'Compact Style',
          false,
        ),
        _preferredAspectRatio = SliderNSNumberParameter(
          'inputPreferredAspectRatio',
          'Preferred Aspect Ratio',
          0,
          min: 0,
          max: double.maxFinite,
        ),
        _maxHeight = SliderNSNumberParameter(
          'inputMaxHeight',
          'Max Height',
          13,
          min: 13,
          max: 283,
        ),
        super('CIPDF417BarcodeGenerator');

  set minHeight(double value) {
    _minHeight.value = value;
  }

  set alwaysSpecifyCompaction(bool value) {
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
        CICategory.builtIn
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
