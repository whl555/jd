import 'package:flutter/cupertino.dart';
import 'package:jd/model/category_page_model.dart';

class CategoryPageProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";

  List<String> categories = [];
  int currentIdx = 0;
  List<CategoryPageModel> models = []; // 二维数组


  CategoryPageProvider(){
    for (int i = 0; i < 10; i++) {
      categories.add("热门推荐$i");
    }

    CategoryPageModel model = CategoryPageModel(
      title: "热门推荐0",
      items: [
        Item(text: "111", img: "assets/image/classify/cooker.png"),
        Item(text: "111", img: "assets/image/classify/briefs.png"),
        Item(text: "111", img: "assets/image/classify/game.png"),
        Item(text: "111", img: "assets/image/classify/crab.png"),
      ]
    );

    CategoryPageModel model2 = CategoryPageModel(
        title: "热门推荐1",
        items: [
          Item(text: "111", img: "assets/image/classify/huawei.png"),
          Item(text: "111", img: "assets/image/classify/milk.png"),
          Item(text: "111", img: "assets/image/classify/phone.png"),
          Item(text: "111", img: "assets/image/classify/power.png"),
        ]
    );

    models.add(model);
    models.add(model2);
  }

  void updateCurrentIdx(int index){
    currentIdx = index;
    notifyListeners();
  }
}