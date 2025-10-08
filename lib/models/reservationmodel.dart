import 'package:playpool_flutter/models/toyDTO.dart';

class ReservationModel {
  ToyDTO toy = ToyDTO();
  String name = '';
  String address = '';
  String dropoff_pickuplocation = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
}