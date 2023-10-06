#!/bin/zsh
flutter pub run pigeon --input pigeons/messages_preview.dart
flutter pub run pigeon --input pigeons/messages_filter.dart

cp -r ios/Classes/Filters/CILookupTableFilter.swift macos/Classes/
cp -r ios/Classes/Filters/CISquareLookupTableFilter.swift macos/Classes/
cp -r ios/Classes/CoreImageFilters.swift macos/Classes/
cp -r ios/Classes/FilterMessages.g.swift macos/Classes/
cp -r ios/Classes/ImagePreview.swift macos/Classes/
cp -r ios/Classes/VideoPreview.swift macos/Classes/
cp -r ios/Classes/PreviewMessages.g.swift macos/Classes/
cp -r ios/Classes/Extensions/Context+extensions.swift macos/Classes/Extensions/
cp -r ios/Classes/Extensions/Error+extensions.swift macos/Classes/Extensions/
cp -r ios/Classes/Extensions/Image+extensions.swift macos/Classes/Extensions/

sed -i '' -e 's/import UIKit//' macos/Classes/ImagePreview.swift

#flutter pub run build_runner build --delete-conflicting-outputs