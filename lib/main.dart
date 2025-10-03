import 'package:flutter/material.dart';
import 'package:playpool_flutter/config/router.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (appState) => AppState(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Color(0xFFFFC943),
        ),
      ),
    );
  }
}
