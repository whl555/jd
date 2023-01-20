import 'package:flutter/material.dart';
import 'package:jd/model/home_page_model.dart';

class HomePageProvider with ChangeNotifier {
  // 主页面的model
  late HomePageModel model;

  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";

  void getHomePageData() {
    isLoading = true;
    isError = false;
    notifyListeners();


    // 3s出现请求成功界面
    Future.delayed(const Duration(seconds: 3), () {
      model = HomePageModel(name: 'whl');
      isLoading = false;
      isError = false;
      notifyListeners();
    });

    // 6s出现失败界面
    Future.delayed(const Duration(seconds: 6), () {
      isLoading = false;
      isError = true;
      errorMessage = "whl error";
      notifyListeners();
    });

  }

  void resume() {
    isError = false;
    isLoading = false;
    notifyListeners();
  }
}
