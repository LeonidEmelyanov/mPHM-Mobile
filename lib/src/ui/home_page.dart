import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/widgets/login_widget.dart';
import 'package:mphm_mobile/src/widgets/pacient_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder<Doctor>(
        stream: Provider.of<LoginBloc>(context).loginStream,
        builder: (context, snapshot) =>
            snapshot.hasData ? PacientWidget() : LoginWidget(),
      );
}
