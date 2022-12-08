import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/authentication.dart';
import '../../../../service/dio_helper/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  Requests? requests;

  void getSearchData(String value) {
    emit(SearchGetNewsLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        
        'q': value,
        'apiKey': 'debdc533d0584f69ba4675767cf653b7'
      },
    ).then(
      (value) {
        requests = Requests.fromJson(value.data);

        emit(SearchGetNewsSuccsesState());
      },
    ).catchError((onError) {
      emit(SearchGetNewsErrorState());
      print('Error is = $onError');
    });
    emit(state);
  }
}
