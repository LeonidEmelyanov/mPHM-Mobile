import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';

class PatientDistincDatesBloc extends BaseBloc<List<DistinctDateModel>> {
  final int patientId;

  PatientDistincDatesBloc(this.patientId) {
    loading();
  }
  
  @override
  Future<List<DistinctDateModel>> getData(bool reload) =>
      repository.getDistinctDates(patientId, reload);
}
