part of 'sciece_cubit.dart';

@immutable
abstract class ScieceState {}

class ScieceInitial extends ScieceState {}
class ScienceGetNewsLoadingState extends ScieceState {}

class  ScienceGetNewsSucssesState extends ScieceState {}

class  ScienceGetNewsErrorState extends ScieceState {}
