import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/models/city_data.dart';
import 'package:travel_app/screens/confirm_booking.dart';
import 'package:travel_app/widgets/counter_field.dart';
import 'package:travel_app/widgets/pop_icon.dart';
import 'package:travel_app/widgets/transportation_type.dart';
import '../core/design_color.dart';
import '../widgets/date_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  static const String route ="BookingScreen";
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? fly_out;
  DateTime? fly_back;
  int adults = 0;
  int children = 0;
  var myFormat = DateFormat('d-MM-yyyy');
  late String departure;
  late String destination;
  TextEditingController departureCtrl = TextEditingController();
  TextEditingController destinationCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: const PopIcon(),
          title: const Text("Booking",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black12,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Column(
            children: [
              TransportationType(width: width, height: height),
              SizedBox(
                height: height * 0.03,
              ),
              Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.67, bottom: height * 0.01),
                    child: const Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  DateField(
                    width: width,
                    fly_back: fly_back,
                    fly_out: fly_out,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.6, bottom: height * 0.01),
                    child: const Text("Departure",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    width: width * 0.85,
                    child: TypeAheadFormField<String>(
                        hideOnEmpty: true,
                        itemBuilder: (context, itemData) {
                          return ListTile(
                            title: Text(itemData),
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          departure = suggestion;
                          departureCtrl.text = suggestion;
                        },
                        suggestionsCallback: CityData.getSuggestion,
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: departureCtrl,
                            cursorColor: Colors.black12,
                            decoration: fieldDesign.copyWith(
                              hintText: "City/Airport",
                            ))),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.6, bottom: height * 0.01),
                    child: const Text("Destination",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    width: width * 0.85,
                    child: TypeAheadFormField<String>(
                        hideOnEmpty: true,
                        itemBuilder: (context, itemData) {
                          return ListTile(
                            title: Text(itemData),
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          destination = suggestion;
                          destinationCtrl.text = suggestion;
                        },
                        suggestionsCallback: CityData.getSuggestion,
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: destinationCtrl,
                            cursorColor: Colors.black12,
                            decoration: fieldDesign.copyWith(
                              hintText: "City/Airport",
                            ))),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.65, bottom: height * 0.01),
                    child: const Text("Adults",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  CounterField(width: width, count: adults),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.65, bottom: height * 0.01),
                    child: const Text("Children",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  CounterField(width: width, count: children),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                      width: width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ConfirmBooking(),));
                        },
                        style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 18))),
                        child: const Text("Search",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ))
                ],
              ))
            ],
          ),
        ));
  }
}
