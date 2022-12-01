#!/bin/zsh
flutter pub run pigeon --input pigeons/messages_preview.dart
flutter pub run pigeon --input pigeons/messages_filter.dart

cp -r ios/Classes/CILookupTableFilter.swift macos/Classes/
cp -r ios/Classes/CoreImageFilters.swift macos/Classes/
cp -r ios/Classes/FilterMessages.g.h macos/Classes/
cp -r ios/Classes/FilterMessages.g.m macos/Classes/
cp -r ios/Classes/ImagePreview.swift macos/Classes/
cp -r ios/Classes/PreviewMessages.g.h macos/Classes/
cp -r ios/Classes/PreviewMessages.g.m macos/Classes/
cp -r ios/Classes/VideoPreview.swift macos/Classes/

sed -i '' -e 's/import Flutter/import FlutterMacOS/' macos/Classes/CoreImageFilters.swift
sed -i '' -e 's/import Flutter/import FlutterMacOS/' macos/Classes/ImagePreview.swift
sed -i '' -e 's/import UIKit//' macos/Classes/ImagePreview.swift
sed -i '' -e 's/import Flutter/import FlutterMacOS/' macos/Classes/VideoPreview.swift