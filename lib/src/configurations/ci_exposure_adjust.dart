part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an exposure adjust filter.
///
/// * [eV] updates the `inputEV` value of filter.
///
/// See also:
///
///  * [CIExposureAdjust](https://developer.apple.com/documentation/coreimage/ciexposureadjust), which
///    defines the exact information for filter.
class CIExposureAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _eV;

  /// Create a [CIExposureAdjustConfiguration] with default values.
  CIExposureAdjustConfiguration()
      : _eV = SliderNSNumberParameter(
          'inputEV',
          'EV',
          0,
          min: -10,
          max: 10,
        ),
        super('CIExposureAdjust');

  /// The amount to adjust the exposure of the image by.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-10.0` to `10.0`.
  set eV(double value) {
    _eV.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };

  @override
  List<ConfigurationParameter> get parameters => [_eV];
}
