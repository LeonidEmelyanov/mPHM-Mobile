import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientDistincDatesBloc extends BaseBloc<List<DistinctDateModel>> {
  final PatientModel patient;

  PatientDistincDatesBloc(this.patient) {
    loading();
  }
  
  @override
  Future<List<DistinctDateModel>> getData(bool reload) {
    return repository.getDistinctDates(patient.id, reload);
  }
}
