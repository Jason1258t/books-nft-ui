part of 'wardrobe_cubit.dart';

@immutable
abstract class WardrobeState {}

class WardrobeInitial extends WardrobeState {}

class WardrobeLoadingState extends WardrobeState {}

class WardrobeFailState extends WardrobeState {}

class WardrobeSuccessState extends WardrobeState {}

