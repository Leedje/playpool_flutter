import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyBall.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String? selectedToyId;

  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppState>();

    var toyList = appContext.initializeToys();

    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisCount: 2,
      children: toyList.map((toy) {
        bool isSelected = selectedToyId == toy.id;
        bool isOtherSelected = selectedToyId != null && !isSelected;

     return Stack(
          clipBehavior: Clip.none,
          children: [
            ToyBall(
              toy: toy,
              scale: isSelected ? 1.2 : (isOtherSelected ? 0.7 : 0.9),
              onTap: () {
                setState(() {
                  selectedToyId = isSelected ? null : toy.id;
                });
              },
            ),
            if (isSelected)
              Positioned(
                right: -10, 
                bottom: -15,
                child: Column(
                  children: [
                    AnimatedOpacity(
                      opacity: isSelected? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.6),
                            ),
                            onPressed: () {
                              appContext.requestToy(toy);
                            },
                            child: const Text("Request"),
                          ),
                        
                    const SizedBox(height: 4),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.6),
                      ),
                      onPressed: () {
                        appContext.addToWishlist(toy);
                        //give animation that it rolls into the wishlist
                      },
                      child: const Text("Wishlist"),
                    ),],
                      ),
                )],
                ),
              ),
          ],
        );
      }).toList(),
    );
  }
}
