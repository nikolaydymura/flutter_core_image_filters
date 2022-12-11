
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

<p align="center">
<a href="https://pub.dev/packages/flutter_core_image_filters"><img src="https://img.shields.io/pub/v/flutter_core_image_filters.svg" alt="Pub"></a>
<a href="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters"><img src="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters/main/master/graph/badge.svg" alt="codecov"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters/actions"><img src="https://github.com/nikolaydymura/flutter_core_image_filters/actions/workflows/flutter_core_image_filters.yaml/badge.svg" alt="build"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters"><img src="https://img.shields.io/github/stars/nikolaydymura/flutter_core_image_filters.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

A flutter package for iOS and MacOS for applying CoreImage filters to image.

## Usage

### Export processed image

```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = BrightnessShaderConfiguration();
configuration.brightness = 0.5;
final image = await configuration.export(texture, texture.size);
```

### LookupTable sample
![LUT](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/lookup_amatorka.png)
```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = LookupTableShaderConfiguration();
configuration.size = 8;
configuration.rows = 8;
configuration.columns = 8;
await configuration.setLutAsset('lookup_amatorka.png');
final image = await configuration.export(texture, texture.size);
```

### LookupTable HALD sample
![LUT](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/lookup_hald.png)
```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = LookupTableShaderConfiguration();
configuration.size = 8;
configuration.rows = 64;
configuration.columns = 8;
await configuration.setLutAsset('lookup_hald.png');
final image = await configuration.export(texture, texture.size);
```

### ImageShaderPreview example
```dart
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late TextureSource texture;
  late BrightnessShaderConfiguration configuration;
  bool textureLoaded = false;

  @override
  void initState() {
    super.initState();
    configuration = BrightnessShaderConfiguration();
    configuration.brightness = 0.5;
    TextureSource.fromAsset('demo.jpeg')
        .then((value) => texture = value)
        .whenComplete(
          () => setState(() {
            textureLoaded = true;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return textureLoaded
        ? ImageShaderPreview(
            texture: texture,
            configuration: configuration,
          )
        : const Offstage();
  }
}
```

### Divided preview sample
```dart
import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late TextureSource texture;
  late BrightnessShaderConfiguration configuration;
  bool textureLoaded = false;

  @override
  void initState() {
    super.initState();
    configuration = BrightnessShaderConfiguration();
    configuration.brightness = 0.5;
    TextureSource.fromAsset('demo.jpeg')
        .then((value) => texture = value)
        .whenComplete(
          () => setState(() {
            textureLoaded = true;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return textureLoaded
        ? BeforeAfter(
            thumbRadius: 0.0,
            thumbColor: Colors.transparent,
            beforeImage: ImageShaderPreview(
              texture: texture,
              configuration: NoneShaderConfiguration(),
            ),
            afterImage: ImageShaderPreview(
              texture: texture,
              configuration: configuration,
            ),
          )
        : const Offstage();
  }
}
```

### Export & save processed image

```dart
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';



final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = BrightnessShaderConfiguration();
configuration.brightness = 0.5;
final image = await configuration.export(texture, texture.size);

final directory = await getTemporaryDirectory();
final output =
File('${directory.path}/result.jpeg');
final bytes = await image.toByteData();
final persistedImage = img.Image.fromBytes(
  image.width,
  image.height,
  bytes!.buffer.asUint8List(),
);
img.JpegEncoder encoder = img.JpegEncoder();
final data = encoder.encodeImage(persistedImage);
await output.writeAsBytes(data);
```

## Additional information

### Support status of [CoreImage filters](https://cifilter.io/)

| Status             | Name                | Display Name        |
|:-------------------|:--------------------|:--------------------|
| :heavy_check_mark: | CIPhotoEffectChrome | Photo Effect Chrome |

- [x] CIPhotoEffectChrome :heavy_check_mark:
- [ ] Bulge Distortion
- [x] CGA Colorspace
- [x] Color Invert
- [x] Color Matrix
- [x] Contrast
- [x] Crosshatch
- [x] Exposure
- [x] False Color
- [x] Gamma
- [x] Grayscale
- [x] Halftone
- [x] Highlight Shadow
- [x] Hue
- [x] Lookup Table
- [x] Luminance
- [x] Luminance Threshold
- [x] Monochrome
- [x] Opacity
- [x] Pixelation
- [x] Posterize
- [x] RGB
- [x] Saturation
- [x] Solarize
- [x] Swirl
- [x] Vibrance
- [x] Vignette
- [x] White Balance
- [x] Zoom Blur

### Sample results

![Brightness](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/Brightness.jpg)

## Examples

- [Big Flutter Filters Demo](https://github.com/nikolaydymura/image_filters_example) - big example of how to use filters and.

## Maintainers

- [Nikolay Dymura](https://github.com/nikolaydymura)
- [Egor Terekhov](https://github.com/EgorEko)