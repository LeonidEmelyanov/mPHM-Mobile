import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';

import '../app.dart';

class BaseBloc<T> extends ChangeNotifier {
  final repository = App.getIt.get<MainRepository>();

  var _isLoading = false;
  var _error;
  T _data;

  get isLoading => _isLoading;

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
}
