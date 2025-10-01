import 'package:flutter/material.dart';
import 'package:playpool_flutter/models/toyDTO.dart';

class ToyCard extends StatelessWidget {
  final ToyDTO toy;
  final double scale;
  final VoidCallback onTap;

  const ToyCard({
    required this.toy,
    required this.scale,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double ballSize = 135;
    const double imageSize = 115;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: ballSize,
          height: ballSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 31, 114, 114),
          ),
          alignment: Alignment.center,
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(toy.image),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.white70,
                  BlendMode.multiply,
                ),
              ),
              border: Border.all(
                width: 4,
                color: Colors.white       ),
            ),
          ),
        ),
      ),
    );
  }
}
