import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

/*
let categories = CIFilter.filterNames(inCategory: nil).map { name in
    let filter = CIFilter(name: name)!
    let cats = filter.attributes["CIAttributeFilterCategories"] as! [String]
    return "'\(name)': [\(cats.map{ c in "'\(c)'"}.joined(separator: ","))]"
}
print(categories.joined(separator: ",\n"))
 */
void main() {
  for (final displayName in FlutterCoreImageFilters.availableFilters) {
    final configuration = FlutterCoreImageFilters.createFilter(
      displayName: displayName,
    );
    final parameters = configuration.parameters.whereType<DataParameter>();
    for (final parameter in parameters) {
      testGroup(displayName, parameter.name);
    }
  }
}

void testGroup(String displayName, String parameterName) {
  group('$displayName $parameterName', () {
    late CIFilterConfiguration config;
    setUp(() {
      config = FlutterCoreImageFilters.createFilter(displayName: displayName);
    });
    test('image file', () {
      testImageFileParameter(config, parameterName);
    });
    test('image data', () {
      testImageParameter(config, parameterName);
    });
    test('image asset', () {
      testImageAssetParameter(config, parameterName);
    });
  });
}

void testImageFileParameter(
  CIFilterConfiguration configuration,
  String parameterName,
) {
  final parameter =
      configuration.parameters.firstWhere((e) => e.name == parameterName)
          as DataParameter;
  expect(parameter.data, isNull);
  expect(parameter.file, isNull);
  expect(parameter.asset, isNull);
  final file = File('demo.jpeg');
  configuration[parameter.name] = file;
  expect(parameter.data, isNull);
  expect(parameter.file, file);
  expect(parameter.asset, isNull);
}

void testImageParameter(
  CIFilterConfiguration configuration,
  String parameterName,
) {
  final parameter =
      configuration.parameters.firstWhere((e) => e.name == parameterName)
          as DataParameter;
  expect(parameter.data, isNull);
  expect(parameter.file, isNull);
  expect(parameter.asset, isNull);
  final data = Uint8List(0);
  configuration[parameter.name] = data;
  expect(parameter.data, data);
  expect(parameter.file, isNull);
  expect(parameter.asset, isNull);
}

void testImageAssetParameter(
  CIFilterConfiguration configuration,
  String parameterName,
) {
  final parameter =
      configuration.parameters.firstWhere((e) => e.name == parameterName)
          as DataParameter;
  expect(parameter.data, isNull);
  expect(parameter.file, isNull);
  expect(parameter.asset, isNull);
  const asset = 'demo.jpeg';
  configuration[parameter.name] = asset;
  expect(parameter.data, isNull);
  expect(parameter.file, isNull);
  expect(parameter.asset, asset);
}

extension on CIFilterConfiguration {
  void operator []=(String key, dynamic value) {
    if (key == 'inputTargetImage') {
      final newThis = this as TargetImageMixin;
      if (value is File) {
        newThis.targetImageFile = value;
      } else if (value is Uint8List) {
        newThis.targetImage = value;
      } else if (value is String) {
        newThis.targetImageAsset = value;
      }
    } else if (key == 'inputBackgroundImage') {
      final newThis = this as BackgroundImageMixin;
      if (value is File) {
        newThis.backgroundImageFile = value;
      } else if (value is Uint8List) {
        newThis.backgroundImage = value;
      } else if (value is String) {
        newThis.backgroundImageAsset = value;
      }
    } else if (key == 'inputBacksideImage') {
      final newThis = this as BacksideImageMixin;
      if (value is File) {
        newThis.backsideImageFile = value;
      } else if (value is Uint8List) {
        newThis.backsideImage = value;
      } else if (value is String) {
        newThis.backsideImageAsset = value;
      }
    } else if (key == 'inputImage2') {
      final newThis = this as Image2Mixin;
      if (value is File) {
        newThis.image2File = value;
      } else if (value is Uint8List) {
        newThis.image2 = value;
      } else if (value is String) {
        newThis.image2Asset = value;
      }
    } else if (key == 'inputTexture') {
      final newThis = this as TextureMixin;
      if (value is File) {
        newThis.textureFile = value;
      } else if (value is Uint8List) {
        newThis.texture = value;
      } else if (value is String) {
        newThis.textureAsset = value;
      }
    } else if (key == 'inputMeans') {
      final newThis = this as MeansImageMixin;
      if (value is File) {
        newThis.meansImageFile = value;
      } else if (value is Uint8List) {
        newThis.meansImage = value;
      } else if (value is String) {
        newThis.meansImageAsset = value;
      }
    } else if (key == 'inputShadingImage') {
      final newThis = this as ShadingImageMixin;
      if (value is File) {
        newThis.shadingImageFile = value;
      } else if (value is Uint8List) {
        newThis.shadingImage = value;
      } else if (value is String) {
        newThis.shadingImageAsset = value;
      }
    } else if (key == 'inputPaletteImage') {
      final newThis = this as PaletteImageMixin;
      if (value is File) {
        newThis.paletteImageFile = value;
      } else if (value is Uint8List) {
        newThis.paletteImage = value;
      } else if (value is String) {
        newThis.paletteImageAsset = value;
      }
    } else if (key == 'inputGradientImage') {
      final newThis = this as GradientImageMixin;
      if (value is File) {
        newThis.gradientImageFile = value;
      } else if (value is Uint8List) {
        newThis.gradientImage = value;
      } else if (value is String) {
        newThis.gradientImageAsset = value;
      }
    } else if (key == 'inputGuideImage') {
      final newThis = this as GuideImageMixin;
      if (value is File) {
        newThis.guideImageFile = value;
      } else if (value is Uint8List) {
        newThis.guideImage = value;
      } else if (value is String) {
        newThis.guideImageAsset = value;
      }
    } else if (key == 'inputSmallImage') {
      final newThis = this as SmallImageMixin;
      if (value is File) {
        newThis.smallImageFile = value;
      } else if (value is Uint8List) {
        newThis.smallImage = value;
      } else if (value is String) {
        newThis.smallImageAsset = value;
      }
    } else if (key == 'inputMaskImage' || key == 'inputMask') {
      final newThis = this as MaskImageMixin;
      if (value is File) {
        newThis.maskImageFile = value;
      } else if (value is Uint8List) {
        newThis.maskImage = value;
      } else if (value is String) {
        newThis.maskImageAsset = value;
      }
    } else if (key == 'inputDisplacementImage') {
      final newThis = this as DisplacementImageMixin;
      if (value is File) {
        newThis.displacementImageFile = value;
      } else if (value is Uint8List) {
        newThis.displacementImage = value;
      } else if (value is String) {
        newThis.displacementImageAsset = value;
      }
    } else if (key == 'inputMessage') {
      final newThis = this as MessageMixin;
      if (value is File) {
        newThis.messageFile = value;
      } else if (value is Uint8List) {
        newThis.messageData = value;
      } else if (value is String) {
        newThis.messageAsset = value;
      }
    } else if (key == 'inputCubeData') {
      final newThis = this as CubeDataMixin;
      if (value is File) {
        newThis.cubeDataFile = value;
      } else if (value is Uint8List) {
        newThis.cubeData = value;
      } else if (value is String) {
        newThis.cubeDataAsset = value;
      }
    } else if (key == 'inputCube0Data') {
      final newThis = this as CIColorCubesMixedWithMaskConfiguration;
      if (value is File) {
        newThis.cubeData0File = value;
      } else if (value is Uint8List) {
        newThis.cubeData0 = value;
      } else if (value is String) {
        newThis.cubeData0Asset = value;
      }
    } else if (key == 'inputCube1Data') {
      final newThis = this as CIColorCubesMixedWithMaskConfiguration;
      if (value is File) {
        newThis.cubeData1File = value;
      } else if (value is Uint8List) {
        newThis.cubeData1 = value;
      } else if (value is String) {
        newThis.cubeData1Asset = value;
      }
    } else if (key == 'inputCurvesData') {
      final newThis = this as CIColorCurvesConfiguration;
      if (value is File) {
        newThis.curvesDataFile = value;
      } else if (value is Uint8List) {
        newThis.curvesData = value;
      } else if (value is String) {
        newThis.curvesDataAsset = value;
      }
    }
  }
}
