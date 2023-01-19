// 枚举类JdApi
enum JdApi {
  // 枚举实例
  homePage('/profiles/homepage'),

  categoryNavi('/profiles/navigationLeft'),

  categoryContent('/profiles/navigationRight'),

  productionsList('/profiles/productionsList'),

  productionsDetail('/profiles/productionDetail');

  static const gg = 0;

  const JdApi(this.val);

  final String val;
  static const head = "https://flutter-jdapi.herokuapp.com/api";

  static const _get = 'GET';
  static const _put = 'PUT';
  static const _post = 'POST';
  static const _delete = 'DELETE';


  String get method{
    switch(this){
      case JdApi.homePage:
        return _get;
      case JdApi.categoryNavi:
        return _get;
      case JdApi.categoryContent:
        return _post;
      case JdApi.productionsList:
       return _get;
      case JdApi.productionsDetail:
        return _get;
    }
  }
}