#!/bin/zsh
dart run pigeon --input pigeons/messages_preview.dart --swift_out darwin/Classes
dart run pigeon --input pigeons/messages_filter.dart --swift_out darwin/Classes

#flutter pub run build_runner build --delete-conflicting-outputs