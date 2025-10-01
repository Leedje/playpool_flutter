import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String? selectedToyId;

  @override
  Widget build(BuildContext context) {
    var toyList = loadData();

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
      ..name = 'Toy #$index'
      ..image = toyImages[index];
  });
}

final List<String> toyImages = [
  'https://media.s-bol.com/gVxZ29YKo49D/E49KJg/1200x995.jpg',
  'https://m.media-amazon.com/images/I/71jolg1fN-L._UF894,1000_QL80_.jpg',
  'https://m.media-amazon.com/images/I/71U06Q9P9YL.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu5yBvi7VszAHbKyNdQHgqcPMkx9QFPdYg_w&s',
  'https://www.timeforkids.com/wp-content/uploads/2023/12/G3G5_231215_furbys.jpg?w=1024',
  'https://d1jqecz1iy566e.cloudfront.net/med4/chf015.jpg',
  'https://m.media-amazon.com/images/I/81Wb8m9Ok7L.jpg',
  'https://m.media-amazon.com/images/I/81jgKtNRMOL._UF894,1000_QL80_.jpg',
  'https://d1jqecz1iy566e.cloudfront.net/med4/fa317.jpg',
  'https://www.cratejoy.com/cdn/shop/files/3dnldAnzSvGLDqEUyPgh.png?crop=center&height=800&v=1758666140&width=1200'
  'https://m.media-amazon.com/images/I/815k5V8u7gL.jpg'
];
