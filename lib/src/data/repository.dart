import 'package:flutter/material.dart';

class Repository {
  final _cash = Map<String, dynamic>();

  @protected
  Future<T> getData<T>(
    String key,
    bool reload,
    Future<T> Function() func,
  ) async {
    if (reload) {
      _clean(key);
    }
    return await _cash[key] ?? (_cash[key] = func());
  }

  void _clean(String key) {
    _cash.removeWhere((k, _) => k.contains(key));
  }
}
