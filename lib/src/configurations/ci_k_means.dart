part of '../../flutter_core_image_filters.dart';

class CIKMeansConfiguration extends CIFilterConfiguration with MeansImageMixin {
  final RectParameter _extent;
  final BoolParameter _perceptual;
  final NumberParameter _count;
  final NumberParameter _passes;

  CIKMeansConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 640, 80),
        ),
        _perceptual = NSBoolParameter(
          'inputPerceptual',
          'Perceptual',
          false,
        ),
        _count = SliderNSIntegerParameter(
          'inputCount',
          'Count',
          8,
          min: 0,
          max: 128,
        ),
        _passes = SliderNSIntegerParameter(
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

  set perceptual(bool value) {
    _perceptual.value = value;
  }

  set count(int value) {
    _count.value = value;
  }

  set passes(int value) {
    _passes.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.reduction,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_extent, _perceptual, _count, _passes, _meansImage];
}
