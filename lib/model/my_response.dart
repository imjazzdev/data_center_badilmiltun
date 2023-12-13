class MyResponse<T> {
  int code;
  String massage;
  T? data;

  MyResponse({this.code = 0, this.massage = '', this.data});

  factory MyResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return MyResponse(
        code: json['code'],
        massage: json['message'],
        data: (json['data'] != null) ? fromJsonModel(json['data']) : null);
  }
}
