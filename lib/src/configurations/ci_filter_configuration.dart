part of flutter_core_image_filters;

abstract class CIFilterConfiguration extends FilterConfiguration {
  static final FilterApi _api =
      FilterApi();

  int _filterId = -1;
  final String name;

  bool get ready => _filterId != -1;

  CIFilterConfiguration(this.name);

  Future<void> prepare() async {
    if (_filterId == -1) {
      _filterId = await _api.create(name);
    }
  }

  Future<void> dispose() async {
    if (_filterId >= 0) {
      await _api.dispose(_filterId);
    }
    _filterId = -1;
  }

  @override
  List<ConfigurationParameter> get parameters => [];
}
