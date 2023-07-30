part of 'purchase_cubit.dart';

@immutable
abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {}

class PurchaseFail extends PurchaseState {}
