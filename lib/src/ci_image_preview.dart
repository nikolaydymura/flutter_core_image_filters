import 'package:flutter/material.dart';

import 'configurations/ci_filter_configuration.dart';

class CIImagePreview extends StatelessWidget {
  final CIFilterConfiguration configuration;

  const CIImagePreview({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _createAndBind(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        final textureId = snapshot.data;
        if (snapshot.hasData && textureId != null) {
          return Texture(textureId: textureId);
        } else if (snapshot.hasError) {
          return const Icon(Icons.error_outline);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<int> _createAndBind() async {
    final textureId = await CIFilterConfiguration.api.createImageSource();
    configuration.textureId = textureId;
    return textureId;
  }
}
