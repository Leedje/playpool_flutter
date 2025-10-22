import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:playpool_flutter/models/reservationmodel.dart';

class ConfirmedToyCard extends StatelessWidget {
  final ReservationModel reservation;

  const ConfirmedToyCard({required this.reservation, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toy = reservation.toy;
    final startDate = reservation.reservationDates.start;
    final endDate = reservation.reservationDates.end;
    final formatter = DateFormat('dd MMM yyyy');
    final formattedRange =
        "${formatter.format(startDate)} → ${formatter.format(endDate)}";

    return Card(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(toy.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(toy.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                    "Reservation dates: \n $formattedRange",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(height: 4),
                  Text("Pickup/Dropoff location: ${reservation.dropoff_pickuplocation}"),
                  SizedBox(height: 4),
                  Text("Status: In Progress"),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
