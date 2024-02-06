part of 'genres_cubit.dart';

@immutable
abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresLoadingState extends GenresState {}

class GenresFailState extends GenresState {}

class GenresSuccessState extends GenresState {}