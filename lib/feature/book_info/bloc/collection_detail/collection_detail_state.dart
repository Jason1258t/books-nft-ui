import 'package:flutter/material.dart';

@immutable
abstract class CollectionDetailState {}

class CollectionDetailInitial extends CollectionDetailState {}

class CollectionDetailSuccess extends CollectionDetailState {}

class CollectionDetailLoading extends CollectionDetailState {}

class CollectionDetailFail extends CollectionDetailState {}