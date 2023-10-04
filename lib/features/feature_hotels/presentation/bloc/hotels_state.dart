part of 'hotels_bloc.dart';

@immutable
abstract class HotelsState {}

class HotelsInitial extends HotelsState {}
class HotelsErrorState extends HotelsState{
  HotelsErrorState(this.message);
String message;
}
class HotelsDataState extends HotelsState{
  HotelsDataState(this.hotels);
  List<Hotel> hotels;
}
