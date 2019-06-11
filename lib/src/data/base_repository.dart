import 'package:flutter/material.dart';

class BaseRepository {
  final _cash = Map<String, dynamic>();

  @protected
  get cash => _cash;

  @protected
  Future<T> getData<T>(
    String key,
    bool reload,
    Future<T> Function() func,
  ) async {
    if (reload) {
      clean(key);
    }
    return await _cash[key] ?? (_cash[key] = func());
  }

  @protected
  void clean(String key) {
    _cash.removeWhere((k, _) => k.contains(key));
  }
}
