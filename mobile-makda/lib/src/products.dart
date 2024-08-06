import 'package:flutter/foundation.dart';
import 'dart:io';

class Item {
   
  final String? name;
  final String? category;
  final String? description;
  final String? price;
  final File? imgpath;

  Item({
   
    this.name,
    this.category,
    this.description,
    this.price,
    this.imgpath,
  });
}


class ItemProvider extends ChangeNotifier {
  static  List <Item> items = [];

  //  static Map<String, dynamic> items = {};
 
  // Map<int, Item> get items => _items;

    void addItem(Item item) {
    items.add(item);

    notifyListeners();
  }

  void removeItem(Item item) {
    items.remove(item);
    notifyListeners();
  }

  static List<Item> retrive(){
    return items;
  }
}
