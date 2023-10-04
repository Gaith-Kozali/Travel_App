import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_app/features/features_auth/presentation/bloc/authentication_bloc.dart';
import '../../domain/entities/hotel.dart';
import '../../domain/use cases/get_hotels_data.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
GetHotelsDataUseCase getHotelsDataUseCase;
  HotelsBloc({required this.getHotelsDataUseCase}) : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) async {
    if(event is GetDataHotelsEvent){
      final data = await getHotelsDataUseCase();
      print("////////////////////////////////@@!##");
      data.fold((failure) {
        emit(HotelsErrorState(failure()));
        print("iiiiiiiiiiinnnnnn the bloc hotels failure fold");
      } , (hotels) {
        emit(HotelsDataState(hotels));
        print("in the bloc hotelsssssssss  success fold$hotels");
      });
    }

    });
  }
}
