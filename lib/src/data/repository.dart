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
      _cash.remove(key);
    }
    return await _cash[key] ?? (_cash[key] = func());
  }
}
