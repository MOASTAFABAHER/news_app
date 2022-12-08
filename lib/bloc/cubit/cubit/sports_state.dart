part of 'sports_cubit.dart';

@immutable
abstract class SportsState {}
class SportsInitial extends SportsState {}
class SportsGetNewsLoadingState extends SportsState {}

class SportsGetNewsSucssesState extends SportsState {}

class SportsGetNewsErrorState extends SportsState {}
