import 'dart:ui';

import 'package:flutter/material.dart' hide Rect;
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

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
        primarySwatch: Colors.blue,
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
                        Icons.navigate_next,
                        color: Theme.of(context).errorColor,
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
                        Icons.navigate_next,
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
  late final CIImagePreviewController destinationSystemController;
  late final CIImagePreviewController destinationOpenGLController;
  late final CIImagePreviewController destinationMetalController;
  var _controllersReady = false;
  static const _assetPath = 'images/demo.jpeg';

  @override
  void initState() {
    super.initState();
    _prepare().whenComplete(() => setState(() {}));
  }

  @override
  void dispose() {
    destinationSystemController.dispose();
    destinationOpenGLController.dispose();
    destinationMetalController.dispose();
    widget.configuration.dispose();
    super.dispose();
  }

  Future<void> _prepare() async {
    if (widget.configuration.hasInputImage) {
      destinationSystemController =
          await CIImagePreviewController.fromAsset(_assetPath);
      destinationOpenGLController =
          await CIImagePreviewController.fromAsset(_assetPath);
      destinationMetalController =
          await CIImagePreviewController.fromAsset(_assetPath);
    } else {
      destinationSystemController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 200, 200),
      );
      destinationOpenGLController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 200, 200),
      );
      destinationMetalController = await CIImagePreviewController.fromRect(
        const Rect.fromLTWH(0, 0, 200, 200),
      );
    }
    await widget.configuration.prepare();
    await widget.configuration.update();
    await destinationSystemController.connect(widget.configuration);
    await destinationOpenGLController.connect(
      widget.configuration,
      context: CIContext.egl,
    );
    await destinationMetalController.connect(
      widget.configuration,
      context: CIContext.mlt,
    );
    _controllersReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _controllersReady
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CIImagePreview(
                      controller: destinationSystemController,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: CIImagePreview(
                      controller: destinationOpenGLController,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: CIImagePreview(
                      controller: destinationMetalController,
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
