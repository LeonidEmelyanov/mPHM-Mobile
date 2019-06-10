import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';

import '../app.dart';

abstract class BaseBloc<T> extends ChangeNotifier {
  final repository = App.getIt.get<MainRepository>();

  var _isLoading = false;
  String _error;
  T _data;

  get isLoading => _isLoading ?? false;

  @protected
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    _data = null;
    _error = null;

    notifyListeners();
  }

  String get error => _error;
  bool get hasError => _error != null;

  @protected
  set error(dynamic error) {
    _error = error != null
        ? error is DioError ? error.message : "Invalide login or password"
        : null;
    _isLoading = false;
    _data = null;

    notifyListeners();
  }

  T get data => _data;

  @protected
  set data(T data) {
    _data = data;
    _isLoading = false;
    _error = null;

    notifyListeners();
  }

  Future<void> loading({bool reload = false, bool showLoading = true}) async {
    try {
      isLoading = showLoading;
      data = await getData(reload);
    } catch (e) {
      error = e;
    }
  }

  Future<T> getData(bool reload);
}
