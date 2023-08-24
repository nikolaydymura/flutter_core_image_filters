// ignore_for_file: deprecated_member_use
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_core_image_filters/src/messages/filter_messages.g.dart';
import 'package:flutter_core_image_filters/src/messages/preview_messages.g.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<CIFilterPlatform>(mixingIn: [MockPlatformInterfaceMixin]),
  MockSpec<CIImagePreviewPlatform>(mixingIn: [MockPlatformInterfaceMixin]),
  MockSpec<CIVideoPreviewPlatform>(mixingIn: [MockPlatformInterfaceMixin]),
  MockSpec<FilterApi>(),
  MockSpec<VideoPreviewApi>(),
  MockSpec<ImagePreviewApi>(),
])
void main() {}
