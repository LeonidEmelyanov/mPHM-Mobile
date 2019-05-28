import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';

import '../app.dart';

abstract class BaseBloc<T> extends ChangeNotifier {
  final repository = App.getIt.get<MainRepository>();

  bool _isLoading = false;
  Exception _error;
  T _data;

  get isLoading => _isLoading ?? false;

  @protected
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    _data = null;
    _error = null;

    notifyListeners();
  }

  get error => _error;
  get hasError => _error != null;

  @protected
  set error(Exception error) {
    _error = error;
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
