import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/feature_hotels/presentation/bloc/hotels_bloc.dart';
import '../../domain/entities/hotel.dart';
import '../widgets/hotel.dart';
import '../widgets/hotels_appbar.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);
  static const String route = "HotelsScreen";

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(slivers: [
        HotelsAppBar(width: width, height: height),
        BlocConsumer<HotelsBloc, HotelsState>(
          builder: (context, state) {
            if (state is HotelsDataState) {
              List<Hotel> hotels = state.hotels;
              return SliverList(
                delegate: SliverChildBuilderDelegate(childCount: hotels.length,
                    (context, index) {
                  return SizedBox(
                      height: height * 0.35,
                      child: HotelWidget(
                        hotel: hotels.elementAt(index),
                      ));
                }),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Text("No data"),
              );
            }
          },
          listener: (context, state) {
            if (state is HotelsErrorState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(state.message),
                    icon: const Icon(Icons.error_outline),
                    iconColor: Colors.red,
                  );
                },
              );
            }
          },
        )
      ]),
    );
  }
}
