import 'dart:io' show File, Directory, Platform;
import 'dart:ui';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' hide Rect;
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'approved_filters.dart';
import 'filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filters Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = kFailedFilters[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FilterPage(
                                configuration: item.configuration,
                              );
                            },
                          ),
                        );
                      },
                      title: Text(item.name),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  );
                },
                childCount: kFailedFilters.length,
              ),
              itemExtent: 64,
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = kFilters[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FilterPage(
                                configuration: item.configuration,
                              );
                            },
                          ),
                        );
                      },
                      title: Text(item.name),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
                childCount: kFilters.length,
              ),
              itemExtent: 64,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  final CIFilterConfiguration configuration;

  const FilterPage({super.key, required this.configuration});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<CIImagePreviewController> controllers = [];
  var _controllersReady = false;
  Color? _bgColor;
  static final _imageFile = File('images/demo.jpeg');
  static final _videoFile = File('videos/demo.mp4');

  @override
  void initState() {
    super.initState();
    _prepare().whenComplete(() => setState(() {}));
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    widget.configuration.dispose();
    super.dispose();
  }

  Future<void> _prepare() async {
    await widget.configuration.prepare();
    await widget.configuration.update();
    await _preparePreview(_imageFile);
    await _preparePreview(File('images/demo-red.jpeg'));
    await _preparePreview(File('images/demo-green.jpeg'));
    await _preparePreview(File('images/demo-blue.jpeg'));
    await _preparePreview(File('images/demo-white.jpeg'));
    await _preparePreview(File('images/demo-black.jpeg'));

    _controllersReady = true;
  }

  Future<void> _preparePreview(File file) async {
    final CIImagePreviewController systemController;
    final CIImagePreviewController openGLController;
    final CIImagePreviewController metalController;
    if (widget.configuration.hasInputImage && Platform.isIOS) {
      systemController = await CIImagePreviewController.fromAsset(file.path);
      openGLController = await CIImagePreviewController.fromAsset(file.path);
      metalController = await CIImagePreviewController.fromAsset(file.path);
    } else if (widget.configuration.hasInputImage && Platform.isIOS) {
      systemController = await CIImagePreviewController.fromFile(file);
      openGLController = await CIImagePreviewController.fromFile(file);
      metalController = await CIImagePreviewController.fromFile(file);
    } else {
      systemController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 300, 300),
      );
      openGLController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 300, 300),
      );
      metalController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 300, 300),
      );
    }
    await systemController.connect(widget.configuration);
    await openGLController.connect(
      widget.configuration,
      context: CIContext.egl,
    );
    await metalController.connect(
      widget.configuration,
      context: CIContext.mlt,
    );
    controllers
      ..add(systemController)
      ..add(openGLController)
      ..add(metalController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        actions: [
          Row(
            children: [
              const Text('Black'),
              Switch(
                value: _bgColor != null,
                onChanged: (value) {
                  setState(() {
                    _bgColor = value ? Colors.black : null;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                _exportVideo();
              },
              tooltip: 'Export video',
              child: const Icon(Icons.video_file),
            ),
            FloatingActionButton(
              heroTag: null,
              tooltip: 'Export image',
              onPressed: () {
                _exportImage();
              },
              child: const Icon(Icons.photo),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _controllersReady
            ? ListView.separated(
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.25,
                    ),
                    color: _bgColor,
                    child: CIImagePreview(
                      controller: controllers[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  if ((index + 1) % 3 == 0) {
                    return const Divider(
                      thickness: 8,
                      color: Colors.black,
                    );
                  }
                  return const SizedBox(
                    height: 8,
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _exportVideo() async {
    final file = _videoFile;
    final root =
        Platform.isIOS ? await getTemporaryDirectory() : Directory('.');
    final output = File(
      '${root.path}/${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}',
    );
    final watch = Stopwatch();
    watch.start();
    final processStream = widget.configuration.exportVideoFile(
      VideoExportConfig(
        Platform.isIOS ? AssetInputSource(file.path) : FileInputSource(file),
        output,
      ),
    );
    await for (final progress in processStream) {
      debugPrint('Exporting file ${(progress * 100).toInt()}%');
    }
    debugPrint('Exporting file took ${watch.elapsedMilliseconds} milliseconds');
    debugPrint('Exported: ${output.absolute}');
  }

  Future<void> _exportImage() async {
    final file = _imageFile;
    final root =
        Platform.isIOS ? await getTemporaryDirectory() : Directory('.');
    final output = File(
      '${root.path}/${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}',
    );
    final watch = Stopwatch();
    watch.start();
    await widget.configuration.exportImageFile(
      ImageExportConfig(
        Platform.isIOS ? AssetInputSource(file.path) : FileInputSource(file),
        output,
        format: ImageExportFormat.jpeg,
      ),
      crop: widget.configuration.hasInputImage
          ? null
          : const Rect.fromLTWH(0, 0, 300, 300),
    );
    debugPrint('Exporting file took ${watch.elapsedMilliseconds} milliseconds');
    debugPrint('Exported: ${output.absolute}');
  }
}
