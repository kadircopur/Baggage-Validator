import 'baggageModel.dart';

class Flight{
  String date;
  String toWhere;
  String where;
  List<Baggage> baggageList;

  Flight(this.date, this.toWhere, this.where, this.baggageList);
}