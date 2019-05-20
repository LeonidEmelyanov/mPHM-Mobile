import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';
import 'package:mphm_mobile/src/widgets/login_widget.dart';
import 'package:mphm_mobile/src/widgets/patients_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<LoginBloc>(context);
    final _repository = Provider.of<MainRepository>(context);

    return ChangeNotifierProvider.value(
      notifier: _bloc,
      child: _bloc.doctor == null
          ? LoginWidget()
          : ChangeNotifierProvider<PatientBloc>.value(
              notifier: PatientBloc(_repository, _bloc.doctor.id),
              child: PatientsWidget(),
            ),
    );
  }
}
