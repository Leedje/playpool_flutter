import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String? selectedToyId;

  @override
  Widget build(BuildContext context) {
    var toyList = context.watch<AppState>().initializeToys();

    return GridView.count(
      crossAxisCount: 2,
      children: toyList.map((toy) {
        bool isSelected = selectedToyId == toy.id;
        bool isOtherSelected = selectedToyId != null && !isSelected;

        return ToyCard(
          toy: toy,
          scale: isSelected ? 1.2 : (isOtherSelected ? 0.7 : 0.9),
          onTap: () {
            setState(() {
              selectedToyId = isSelected ? null : toy.id;
            });
          },
        );
      }).toList(),
    );
  }
}

List<ToyDTO> loadData() {
  return List.generate(10, (index) {
    return ToyDTO()
      ..id = 'toy_$index'
      ..name = 'Toy #$index';
  });
}
