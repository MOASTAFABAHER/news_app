import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/authentication.dart';
import '../../../../service/dio_helper/dio_helper.dart';

part 'sciece_state.dart';

class ScieceCubit extends Cubit<ScieceState> {
  ScieceCubit() : super(ScieceInitial());
    static ScieceCubit get(context) => BlocProvider.of(context);
  Requests? requests;
   List<dynamic> sicenceNews = [];
  void getScienceData() {
    emit(ScienceGetNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        "category": "science",
        'apiKey': 'debdc533d0584f69ba4675767cf653b7'
      },
    ).then(
      (value) {
        requests = Requests.fromJson(value.data);

        emit(ScienceGetNewsSucssesState());
      },
    ).catchError((onError) {
      emit(ScienceGetNewsErrorState());
      print(onError.toString());
    });
    emit(state);
  }

}
