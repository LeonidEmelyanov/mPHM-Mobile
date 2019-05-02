import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorDialog extends StatelessWidget {
  final String _message;

  ErrorDialog(this._message);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text("Error"),
        content: Text(_message),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );

  show(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (context) => this,
        ));
  }
}
