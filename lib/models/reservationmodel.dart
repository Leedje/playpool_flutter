import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';

class ReservationModel {
  ToyDTO toy = ToyDTO();
  String name = '';
  String address = '';
  String? dropoff_pickuplocation;
  DateTimeRange reservationDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());
}