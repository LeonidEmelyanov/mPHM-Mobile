import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';

class PatientCardiaogramsBloc extends BaseBloc<List<DistinctDateModel>> {
  final int patientId;

  PatientCardiaogramsBloc(this.patientId);

  void getDates([bool reload = false]) async {
    try {
      isLoading = !reload;
      data = await repository.getDistinctDates(patientId, reload);
    } catch (e) {
      error = e;
    }
  }
}
