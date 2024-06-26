part of '../../flutter_core_image_filters.dart';

enum CIContext { egl, mlt, system }

extension _CIContext on CIContext {
  String get platformKey {
    switch (this) {
      case CIContext.egl:
        return 'openGLES2';
      case CIContext.mlt:
        return 'MLT';
      case CIContext.system:
        return 'system';
    }
  }
}
