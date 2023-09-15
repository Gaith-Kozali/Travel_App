import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/widgets/date_field.dart';
import 'package:travel_app/widgets/pop_icon.dart';

import '../core/design_color.dart';
import '../models/city_data.dart';

class AddTrip extends StatelessWidget {
  AddTrip({Key? key}) : super(key: key);
 static const String route ="AddTrip";
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
          title: const Text("Add trip",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black12,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: height * 0.04),
          child: Center(
            child: Column(
              children: [
                Container(
                   decoration: BoxDecoration(
                       color: color, borderRadius: BorderRadius.circular(20)),
                   width: width * 0.85,
                   height: height * 0.2,
                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         IconButton(
                             onPressed: () {},
                             icon: const Icon(
                               Icons.add,
                               color: Colors.white,
                               size: 30,
                             )),
                         SizedBox(
                           height: height * 0.01,
                         ),
                         const Text(
                           "Add cover photo",
                           style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.w500),
                         )
                       ])),
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.6, bottom: height * 0.01,top: height*0.05),
                      child: const Text("Trip name",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      width: width * 0.85,
                      child: TextFormField(
                        cursorColor: Colors.black12,
                        decoration: fieldDesign.copyWith(
                          hintText: "Trip Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.6, bottom: height * 0.01,top: height*0.02),
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
                                  borderSide:
                                      BorderSide(color: Colors.black26)),
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
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.67, bottom: height * 0.01,top: height*0.02),
                      child: const Text(
                        "Date",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                   DateField(fly_out: fly_out, fly_back: fly_back, width: width),
                    SizedBox(height:height*0.08 ,),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  horizontal: width * 0.37, vertical: 18))),
                      child: const Text("Next",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
