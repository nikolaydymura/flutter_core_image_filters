#!/bin/zsh
dart run pigeon --input pigeons/messages_preview.dart --swift_out darwin/flutter_core_image_filters/Sources/flutter_core_image_filters/
dart run pigeon --input pigeons/messages_filter.dart --swift_out darwin/flutter_core_image_filters/Sources/flutter_core_image_filters/

#flutter pub run build_runner build --delete-conflicting-outputs