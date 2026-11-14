import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  static const String _storageKey = 'favorite_ids';

  final Set<String> _ids = {};

  bool isFavorite(String id) => _ids.contains(id);

  Set<String> get ids => Set.unmodifiable(_ids);

  //TODO: 1. Load saved workout favorit dari device
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_storageKey) ?? [];
    _ids
      ..clear()
      ..addAll(saved);
    notifyListeners();
  }

  //TODO: 2. Tambah atau hapus favorit, save list terbaru ke device
  void toggle(String id) {
    if (!_ids.remove(id)) {
      _ids.add(id);
    }
    notifyListeners();
    _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_storageKey, _ids.toList());
  }
}