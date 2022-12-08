part of 'business_cubit.dart';

@immutable
abstract class BusinessState {}

class BusinessInitial extends BusinessState {}
class BusinessGetNewsLoadingState extends BusinessState {}
class BusinessGetNewsSucssesState extends BusinessState {}
class BusinessGetNewsErrorState extends BusinessState {}
