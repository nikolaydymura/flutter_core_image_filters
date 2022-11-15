part of flutter_core_image_filters;

abstract class CIFilterConfiguration extends FilterConfiguration {
  static final CoreImageFiltersPlatform _api =
      CoreImageFiltersPlatform.instance;

  int _filterId = -1;
  final String name;

  bool get ready => _filterId != -1;

  CIFilterConfiguration(this.name);

  Future<void> prepare() async {
    if (_filterId == -1) {
      _filterId = await _api.prepareFilter(name);
    }
  }

  Future<void> dispose() async {
    if (_filterId >= 0) {
      await _api.disposeFilter(_filterId);
    }
    _filterId = -1;
  }
}
