part of 'purchase_cubit.dart';

enum BuyType {place, shelf, book}

abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {
  BuyType buyType;
  String? buyId;

  PurchaseSuccess({required this.buyType, this.buyId});
}

class PurchaseFail extends PurchaseState {}
