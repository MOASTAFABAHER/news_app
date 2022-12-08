import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/authentication.dart';
import '../../../service/dio_helper/dio_helper.dart';

part 'business_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit() : super(BusinessInitial());
  static BusinessCubit get(context) => BlocProvider.of(context);
  Requests? requests;

  void getBusinessData() {
    emit(BusinessGetNewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        "category": "business",
        'apiKey': 'debdc533d0584f69ba4675767cf653b7'
      },
    ).then(
      (value) {
        requests = Requests.fromJson(value.data);

        emit(BusinessGetNewsSucssesState());
      },
    ).catchError((onError) {
      emit(BusinessGetNewsErrorState());
      print(onError.toString());
    });
    emit(state);
  }
}
