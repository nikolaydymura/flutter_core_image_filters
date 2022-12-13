import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: VideoExportPage(
        configuration: CIPhotoEffectNoirConfiguration(),
      ),
    );
  }
}

class VideoExportPage extends StatefulWidget {
  final CIFilterConfiguration configuration;

  const VideoExportPage({super.key, required this.configuration});

  @override
  State<VideoExportPage> createState() => _CIFilterDetailsPageState();
}

class _CIFilterDetailsPageState extends State<VideoExportPage> {
  var _controllersReady = false;

  @override
  void initState() {
    super.initState();
    _prepare().whenComplete(() => setState(() {}));
  }

  @override
  void dispose() {
    widget.configuration.dispose();
    super.dispose();
  }

  Future<void> _prepare() async {
    await widget.configuration.prepare();
    _controllersReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exportVideo();
        },
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _exportVideo() async {
    final data = await rootBundle.load('images/demo.jpeg');
    final directory = await getTemporaryDirectory();
    final output =
        File('${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpeg');
    final watch = Stopwatch();
    watch.start();
    await widget.configuration.exportImageFile(
      ImageExportConfig(
        DataInputSource(data.buffer.asUint8List()),
        output,
      ),
    );
    debugPrint('Exporting file took ${watch.elapsedMilliseconds} milliseconds');
    debugPrint('Exported: ${output.absolute}');
  }
}
