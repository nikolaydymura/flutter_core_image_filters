part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a PDF417 barcode generator filter.
///
/// * [minHeight] updates the `inputMinHeight` value of filter.
/// * [alwaysSpecifyCompaction] updates the `inputAlwaysSpecifyCompaction` value of filter.
/// * [dataColumns] updates the `inputDataColumns` value of filter.
/// * [minWidth] updates the `inputMinWidth` value of filter.
/// * [maxWidth] updates the `inputMaxWidth` value of filter.
/// * [correctionLevel] updates the `inputCorrectionLevel` value of filter.
/// * [compactionMode] updates the `inputCompactionMode` value of filter.
/// * [rows] updates the `inputRows` value of filter.
/// * [compactStyle] updates the `inputCompactStyle` value of filter.
/// * [preferredAspectRatio] updates the `inputPreferredAspectRatio` value of filter.
/// * [maxHeight] updates the `inputMaxHeight` value of filter.
///
/// See also:
///
///  * [CIPDF417BarcodeGenerator](https://developer.apple.com/documentation/coreimage/cipdf417barcodegenerator), which
///    defines the exact information for filter.
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

  /// Create a [CIPDF417BarcodeGeneratorConfiguration] with default values.
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

  /// The minimum height, in pixels, of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `13.0` to `283.0`.
  set minHeight(int value) {
    _minHeight.value = value;
  }

  /// A Boolean value specifying whether to force compaction style.
  ///
  /// Defaults to `false`.
  set alwaysSpecifyCompaction(bool value) {
    _alwaysSpecifyCompaction.value = value;
  }

  /// The number of data columns in the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `1.0` to `30.0`.
  set dataColumns(int value) {
    _dataColumns.value = value;
  }

  /// The minimum width, in pixels, of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `56.0` to `583.0`.
  set minWidth(int value) {
    _minWidth.value = value;
  }

  /// The maximum width, in pixels, of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `56.0` to `583.0`.
  set maxWidth(int value) {
    _maxWidth.value = value;
  }

  /// The correction level ratio of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `0.0` to `8.0`.
  set correctionLevel(int value) {
    _correctionLevel.value = value;
  }

  /// The compaction mode of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `0.0` to `3.0`.
  set compactionMode(int value) {
    _compactionMode.value = value;
  }

  /// The number of rows in the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `3.0` to `90.0`.
  set rows(int value) {
    _rows.value = value;
  }

  /// A Boolean value specifying whether to force compact style Aztec code.
  ///
  /// Defaults to `false`.
  set compactStyle(bool value) {
    _compactStyle.value = value;
  }

  /// The preferred aspect ratio of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `0.0` to `9223372036854776000.0`.
  set preferredAspectRatio(double value) {
    _preferredAspectRatio.value = value;
  }

  /// The maximum height, in pixels, of the generated barcode.
  ///
  /// Defaults to `double.nan`.
  ///
  /// Range: `13.0` to `283.0`.
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
