import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/pacient_bloc.dart';
import 'package:provider/provider.dart';

class PacientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Pacient"),
        ),
        body: StreamBuilder<void>(
          stream: Provider.of<PacientBloc>(context).stream,
          builder: (context, snapshot) => Container(),
        ),
      );
}
