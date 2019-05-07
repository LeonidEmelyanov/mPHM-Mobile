import 'dart:async';

class PacientBloc {
  final _controller = StreamController<void>();

  get stream => _controller.stream;

  dispose() async {
    await _controller.close();
  }
}
