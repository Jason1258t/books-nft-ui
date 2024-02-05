import 'package:flutter/material.dart';

@immutable
abstract class CollectionInfoState {}

class CollectionInfoInitial extends CollectionInfoState {}

class CollectionInfoSuccess extends CollectionInfoState {}

class CollectionInfoLoading extends CollectionInfoState {}

class CollectionInfoFail extends CollectionInfoState {}
