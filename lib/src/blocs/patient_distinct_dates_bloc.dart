import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/blocs/distinct_date_info_bloc.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientDistincDatesBloc extends BaseBloc<List<DistinctDateBloc>> {
  final PatientModel patient;

  PatientDistincDatesBloc(this.patient) {
    loading();
  }

  @override
  Future<List<DistinctDateBloc>> getData(bool reload) async => (await repository
          .getDistinctDates(patient.id, reload))
      .map<DistinctDateBloc>((model) => DistinctDateBloc(patient, model))
      .toList()
        ..sort((left, right) => right.model.date.compareTo(left.model.date));
}
