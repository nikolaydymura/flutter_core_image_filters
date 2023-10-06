#!/bin/zsh
flutter pub run pigeon --input pigeons/messages_preview.dart
flutter pub run pigeon --input pigeons/messages_filter.dart

#flutter pub run build_runner build --delete-conflicting-outputs