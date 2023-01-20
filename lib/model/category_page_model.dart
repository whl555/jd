class CategoryPageModel {
  String title;
  List<Item> items;

  CategoryPageModel({required this.title, required this.items});
}

class Item {
  String text;
  String img;

  Item({required this.text, required this.img});
}