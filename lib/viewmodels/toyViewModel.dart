import 'package:playpool_flutter/models/toyDTO.dart';

class ToyViewModel {
//import app context


var toyList = <ToyDTO>[
  ToyDTO(),
  ToyDTO()
];

void addToWishlist(String toyId) {
  var wishlist = <ToyDTO>[];
  //here i should be taking the toy and adding it to the app's context for now

}

bool requestToy(ToyDTO toy){
  return false;
}
}