import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ParentVerificationScreen extends StatefulWidget {
  @override
  State<ParentVerificationScreen> createState() =>
      _ParentVerificationScreenState();
}

class _ParentVerificationScreenState extends State<ParentVerificationScreen> {
  int attemptsLeft = 4;
  String? errorMessage;

  void handlePin(String pin) {
    if (pin == '1234') {
      context.go('/requests'); 
    } else {
      setState(() {
        attemptsLeft--;
        errorMessage = 'Incorrect PIN. $attemptsLeft attempts left.';
      });

      if (attemptsLeft <= 0) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Access Denied"),
            content: Text("Parent has been notified of this attempt."),
            actions: [
              TextButton(
                onPressed: () => context.go('/'),
                child: Text("Back to Home"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 220, 203),
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: Colors.amber),
    );

    return Scaffold(
      backgroundColor: Color(0xFFFFECBD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: handlePin,
            ),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
