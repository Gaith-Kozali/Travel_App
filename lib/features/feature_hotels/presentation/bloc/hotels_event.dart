part of 'hotels_bloc.dart';

@immutable
abstract class HotelsEvent {}

class HotelsFilterEvent extends HotelsEvent{

}
class GetDataHotelsEvent extends HotelsEvent{

}