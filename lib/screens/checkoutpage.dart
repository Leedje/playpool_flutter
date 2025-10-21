import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/models/reservationmodel.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  final String toyId;

  const CheckoutPage({required this.toyId});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  ReservationModel reservation = ReservationModel();
  final _formKey = GlobalKey<FormState>();
  DateTimeRange? selectedDates;
  
  @override
  Widget build(BuildContext context) {
    final toy = context.watch<AppState>().getToyById(widget.toyId);
    final appContext = context.watch<AppState>();
    

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),

              //Start Form
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
                    ToyCard(toy: toy),
                    Card(
                      color: Colors.white,
                      child: TextFormField(
                        initialValue: reservation.name,
                        onChanged: (value) => reservation.name = value,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          selectedDates == null
                              ? 'Select Reservation Dates'
                              : '${selectedDates!.start.toLocal().toString().split(' ')[0]} → ${selectedDates!.end.toLocal().toString().split(' ')[0]}',
                        ),
                        trailing: Icon(Icons.calendar_today),
                        onTap: () async {
                          final picked = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                          if (picked != null) {
                            setState(() {
                              selectedDates = picked;
                              reservation.reservationDates = picked;
                            });
                          }
                        },
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: TextFormField(
                        initialValue: reservation.address,
                        onChanged: (value) => reservation.address = value,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(border: InputBorder.none),
                          hint: Text('Select Dropoff/Pickup Location'),
                          isExpanded: true,
                          initialValue: reservation.dropoff_pickuplocation,
                          onSaved: (newValue) => reservation.dropoff_pickuplocation = newValue,
                          items: List.generate(5, (int index) {
                            final location = 'Location $index';
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }),
                          onChanged: (location) {
                            setState(() {
                              reservation.dropoff_pickuplocation = location;
                            });
                          },
                          validator: (location) {
                            if (location == null) {
                              return 'Please select a dropoff and pickup location.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {
                        final isFormValid = _formKey.currentState!.validate();
                        final hasDates = selectedDates != null;

                        if (!hasDates) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select reservation dates'),
                            ),
                          );
                        }

                        if (isFormValid && hasDates) {
                          _formKey.currentState!.save();
                          reservation.toy = toy; // make sure toy is assigned
                          if (appContext.submitReservation(reservation)) {
                            context.replace('/confirmationscreen');
                          }
                        }

                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFFFFC943),
                      ),
                      child: Text('Confirm Reservation'),
                    ),
                  ],
                ),
              ),
            ),
            //End Form

            /// Top-left back button
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  label: Text('Back', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
