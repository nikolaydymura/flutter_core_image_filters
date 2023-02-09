part of flutter_core_image_filters;

class CGColorSpaceParameter extends OptionStringParameter<CGColorSpace> {
  CGColorSpaceParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setNSStringParameter(
      configuration._filterId,
      name,
      value.platformKey,
    );
  }

  @override
  List<CGColorSpace> get values => CGColorSpace.values;
}

enum CGColorSpace implements OptionString {
  displayP3,
  genericRGBLinear,
  adobeRGB1998,
  sRGB,
  acescgLinear,
  itur709,
  itur2020,
  rommrgb,
  dcip3,
  extendedLinearITUR2020,
  extendedLinearDisplayP3,
  displayP3HLG,
  extendedSRGB,
  linearSRGB,
  extendedLinearSRGB,
  none;

  @override
  String get platformKey {
    switch (this) {
      case CGColorSpace.displayP3:
        return 'displayP3';
      case CGColorSpace.genericRGBLinear:
        return 'genericRGBLinear';
      case CGColorSpace.adobeRGB1998:
        return 'adobeRGB1998';
      case CGColorSpace.sRGB:
        return 'sRGB';
      case CGColorSpace.acescgLinear:
        return 'acescgLinear';
      case CGColorSpace.itur709:
        return 'itur_709';
      case CGColorSpace.itur2020:
        return 'itur_2020';
      case CGColorSpace.rommrgb:
        return 'rommrgb';
      case CGColorSpace.dcip3:
        return 'dcip3';
      case CGColorSpace.extendedLinearITUR2020:
        return 'extendedLinearITUR_2020';
      case CGColorSpace.extendedLinearDisplayP3:
        return 'extendedLinearDisplayP3';
      case CGColorSpace.displayP3HLG:
        return 'displayP3_HLG';
      case CGColorSpace.extendedSRGB:
        return 'extendedSRGB';
      case CGColorSpace.linearSRGB:
        return 'linearSRGB';
      case CGColorSpace.extendedLinearSRGB:
        return 'extendedLinearSRGB';
      case CGColorSpace.none:
        return '';
    }
  }
}
