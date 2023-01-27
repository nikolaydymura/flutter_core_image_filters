part of flutter_core_image_filters;

class CISpotColorConfiguration extends CIFilterConfiguration {
  final ColorParameter _centerColor2;
  final NumberParameter _closeness2;
  final NumberParameter _contrast1;
  final NumberParameter _contrast3;
  final ColorParameter _replacementColor2;
  final ColorParameter _centerColor1;
  final NumberParameter _closeness1;
  final NumberParameter _contrast2;
  final ColorParameter _replacementColor1;
  final ColorParameter _centerColor3;
  final NumberParameter _closeness3;
  final ColorParameter _replacementColor3;

  CISpotColorConfiguration()
      : _centerColor2 = CIColorParameter(
          'inputCenterColor2',
          'Center Color 2',
          const Color.fromRGBO(134, 78, 88, 1),
        ),
        _closeness2 = SliderNSNumberParameter(
          'inputCloseness2',
          'Closeness 2',
          0.15,
          min: 0,
          max: 0.5,
        ),
        _contrast1 = SliderNSNumberParameter(
          'inputContrast1',
          'Contrast 1',
          0.98,
          min: 0,
          max: 1,
        ),
        _replacementColor2 = CIColorParameter(
          'inputReplacementColor2',
          'Replacement Color 2',
          const Color.fromRGBO(233, 143, 129, 1),
        ),
        _centerColor1 = CIColorParameter(
          'inputCenterColor1',
          'Center Color 1',
          const Color.fromRGBO(20, 16, 18, 1),
        ),
        _contrast3 = SliderNSNumberParameter(
          'inputContrast3',
          'Contrast 3',
          0.99,
          min: 0,
          max: 1,
        ),
        _closeness1 = SliderNSNumberParameter(
          'inputCloseness1',
          'Closeness 1',
          0.22,
          min: 0,
          max: 0.5,
        ),
        _contrast2 = SliderNSNumberParameter(
          'inputContrast2',
          'Contrast 2',
          0.98,
          min: 0,
          max: 1,
        ),
        _replacementColor1 = CIColorParameter(
          'inputReplacementColor1',
          'Replacement Color 1',
          const Color.fromRGBO(112, 49, 50, 1),
        ),
        _centerColor3 = CIColorParameter(
          'inputCenterColor3',
          'Center Color 3',
          const Color.fromRGBO(235, 116, 85, 1),
        ),
        _closeness3 = SliderNSNumberParameter(
          'inputCloseness3',
          'Closeness 3',
          0.5,
          min: 0,
          max: 0.5,
        ),
        _replacementColor3 = CIColorParameter(
          'inputReplacementColor3',
          'Replacement Color 3',
          const Color.fromRGBO(232, 192, 155, 1),
        ),
        super('CISpotColor');

  set centerColor2(Color value) {
    _centerColor2.value = value;
  }

  set closeness2(double value) {
    _closeness2.value = value;
  }

  set contrast1(double value) {
    _contrast1.value = value;
  }

  set replacementColor2(Color value) {
    _replacementColor2.value = value;
  }

  set centerColor1(Color value) {
    _centerColor1.value = value;
  }

  set contrast3(double value) {
    _contrast3.value = value;
  }

  set closeness1(double value) {
    _closeness1.value = value;
  }

  set contrast2(double value) {
    _contrast2.value = value;
  }

  set replacementColor1(Color value) {
    _replacementColor1.value = value;
  }

  set centerColor3(Color value) {
    _centerColor3.value = value;
  }

  set closeness3(double value) {
    _closeness3.value = value;
  }

  set replacementColor3(Color value) {
    _replacementColor3.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.builtIn,
        CICategory.stillImage,
        CICategory.video,
        CICategory.highDynamicRange,
        CICategory.stylize
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _centerColor2,
        _closeness2,
        _contrast1,
        _replacementColor2,
        _centerColor1,
        _contrast3,
        _closeness1,
        _contrast2,
        _replacementColor1,
        _centerColor3,
        _closeness3,
        _replacementColor3,
      ];
}
