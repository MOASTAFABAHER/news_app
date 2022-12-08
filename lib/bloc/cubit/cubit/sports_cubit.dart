import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/authentication.dart';
import '../../../service/dio_helper/dio_helper.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit() : super(SportsInitial());
  static SportsCubit get(context) => BlocProvider.of(context);
  Requests? requests;
    List<dynamic> sportsNews = [];
    void getSportData() {
    emit(SportsGetNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        "category": "sports",
        'apiKey': 'debdc533d0584f69ba4675767cf653b7'
      },
    ).then(
      (value) {
        requests = Requests.fromJson(value.data);

        emit(SportsGetNewsSucssesState());
      },
    ).catchError((onError) {
      emit(SportsGetNewsErrorState());
      print(onError.toString());
    });
    emit(state);
  }
}
