part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchGetNewsLoadingState extends SearchState {}
class SearchGetNewsSuccsesState extends SearchState {}
class SearchGetNewsErrorState extends SearchState {}
