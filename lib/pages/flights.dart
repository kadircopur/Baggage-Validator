import 'package:baggage_validator/models/baggageModel.dart';
import 'package:baggage_validator/pages/baggages.dart';
import 'package:baggage_validator/utilities/theme_constants.dart';
import 'package:flutter/material.dart';

import '../models/flight_model.dart';
import '../models/baggageModel.dart';

class FlightsPage extends StatefulWidget {
  const FlightsPage({Key? key}) : super(key: key);
  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  static List<Baggage> baggageList = <Baggage>[
    Baggage(15, "Unknown"),
    Baggage(15, "Unknown"),
    Baggage(15, "Unknown"),
    Baggage(15, "Unknown"),
  ];

  List<Flight> flightList = <Flight>[
    Flight("November", "London", "Paris", baggageList),
    Flight("November", "Flo Rid", "New York", baggageList),
    Flight("November", "Meksika", "Washington dc", baggageList),
    Flight("November", "Almanya", "Türkiye", baggageList),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flights",
          style: TextStyle(
            color: COLOR_WHITE,
            fontSize: 20,
          ),
        ),
        backgroundColor: COLOR_DARK_BLUE,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: flightList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        top: BorderSide(width: 3.0, color: Color(0xFFDFDFDF)),
                        left: BorderSide(width: 3.0, color: Color(0xFFDFDFDF)),
                        right: BorderSide(width: 3.0, color: Color(0xFF7F7F7F)),
                        bottom:
                            BorderSide(width: 3.0, color: Color(0xFF7F7F7F)),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.airplane_ticket_sharp,
                        size: 50,
                        color: COLOR_DARK_BLUE,
                      ),
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BaggagesPage(flightList[index])));
                      },
                      title: Text(
                        "${flightList[index].where}\n${flightList[index].toWhere}",
                        style: TEXT_THEME_DEFAULT.headline3,
                      ),
                      subtitle: Text(
                        flightList[index].date,
                        style: TEXT_THEME_DEFAULT.subtitle1,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      backgroundColor: COLOR_DARK_BLUE,
    );
  }
}
