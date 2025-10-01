import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:provider/provider.dart';

class ToyRequestsPage extends StatefulWidget{
var requestedToys = <ToyDTO>[];
  @override
  State<ToyRequestsPage> createState() => _ToyRequestsPageState();

  Widget build (BuildContext context){

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ...requestedToys.map((toy) => Card(child: ListTile(
          title: Text(toy.name),
          leading: Icon(Icons.toys_outlined),
        )))
      ],
    );
  }
  
}

class _ToyRequestsPageState extends State<ToyRequestsPage> {
  
  @override
  Widget build(BuildContext context){
    var requestedToys = context.watch<AppState>().requestedToys;

    return Container(
      color: const Color.fromARGB(255, 219, 219, 219), 
      child: ListView(
        children: [ ...requestedToys.map((toy) => Card( child: 
          ListTile(title: Text(toy.name))
        ))],
      ));
  }
}