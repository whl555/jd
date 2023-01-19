import 'package:jd/manager/api/api.dart';
import 'package:dio/dio.dart';
import 'package:jd/manager/api/client.dart';
void getHttp() async {
  try {
    var response = await Dio().get('https://flutter-jdapi.herokuapp.com/api/profiles/homepage');
    print(response.headers);
  } catch (e) {
    print(e);
  }
}

main() {
  print(JdApi.categoryContent.val);
  print(JdApi.values);
  print(JdApi.homePage.method);
  print(JdApi.homePage.index); // 枚举实例的次序
  print(JdApi.homePage.name); // 枚举实例的值
  print(JdApi.homePage.runtimeType); // object类
  print(JdApi.homePage.toString()); // object类


  getHttp();
}