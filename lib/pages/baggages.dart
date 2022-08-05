import 'package:baggage_validator/pages/qr_page.dart';
import 'package:baggage_validator/utilities/theme_constants.dart';
import 'package:flutter/material.dart';
import '../models/flight_model.dart';

class BaggagesPage extends StatefulWidget {
  final Flight flight;
  const BaggagesPage(this.flight, {Key? key}) : super(key: key);

  @override
  State<BaggagesPage> createState() => _BaggagesPageState();
}

class _BaggagesPageState extends State<BaggagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Baggages",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: COLOR_DARK_BLUE,
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: widget.flight.baggageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Image.asset('assets/images/icons8-baggage-64.png'),
                  title: Text(
                    "${widget.flight.baggageList[index].weight.toString()} kg",
                    style: TEXT_THEME_DEFAULT.headline4,
                  ),
                  subtitle: Text(
                      "Status: ${widget.flight.baggageList[index].bagStatus}",
                      style: TEXT_THEME_DEFAULT.subtitle2),
                  onTap: () async {
                    bool isComplete = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QRpage()));
                    if (isComplete) {
                      setState(() {
                        widget.flight.baggageList[index].bagStatus = "Claimed";
                      });
                    }
                  },
                ),
              );
            }),
      ),
      backgroundColor: COLOR_DARK_BLUE,
    );
  }
}
