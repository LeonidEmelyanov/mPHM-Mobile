import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';

class PatientDatasBloc extends BaseBloc<List<DataInfoModel>> {
  final int _date;
  final int _patientId;

  PatientDatasBloc(this._date, this._patientId);

  void load([bool reload = false]) async {
    try {
      isLoading = !reload;
      data = await repository.getDatasByDate(_date, _patientId, reload);
    } catch (e) {
      error = e;
    }
  }
}
