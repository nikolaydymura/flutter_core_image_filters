part of flutter_core_image_filters;

class CIKMeansConfiguration extends CIFilterConfiguration with MeansImageMixin {
  final RectParameter _extent;
  final NumberParameter _perceptual;
  final NumberParameter _count;
  final NumberParameter _passes;

  CIKMeansConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 640, 80),
        ),
        _perceptual = SliderNSNumberParameter(
          'inputPerceptual',
          'Perceptual',
          0,
          min: 0,
          max: 1,
        ),
        _count = SliderNSNumberParameter(
          'inputCount',
          'Count',
          8,
          min: 0,
          max: 128,
        ),
        _passes = SliderNSNumberParameter(
          'inputPasses',
          'Passes',
          5,
          min: 0,
          max: 20,
        ),
        super('CIKMeans');

  set extent(Rect value) {
    _extent.value = value;
  }

  set perceptual(double value) {
    _perceptual.value = value;
  }

  set count(double value) {
    _count.value = value;
  }

  set passes(double value) {
    _passes.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_extent, _perceptual, _count, _passes, _meansImage];
}
