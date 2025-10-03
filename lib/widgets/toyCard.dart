import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';

class ToyCard extends StatelessWidget {
  final ToyDTO toy;

  const ToyCard({
    required this.toy,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(1.2),
                    width: 90,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: NetworkImage(toy.image), fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    width: 135,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(toy.name, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Condition: ${toy.condition}"),
                        Text("Age Group: ${toy.ageGroup} years")
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
