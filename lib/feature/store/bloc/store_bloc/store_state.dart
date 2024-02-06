part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoadingState extends StoreState {}

class StoreFailState extends StoreState {}

class StoreSuccessState extends StoreState {}
