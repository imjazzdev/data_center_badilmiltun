class MyResponse<T> {
  bool success;
  String message;
  T? data;

  MyResponse({required this.success, this.message = '', this.data});

  factory MyResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return MyResponse(
        success: json['success'],
        message: json['message'],
        data: (json['data'] != null) ? fromJsonModel(json['data']) : null);
  }
}
