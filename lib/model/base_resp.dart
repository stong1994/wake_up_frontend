class BaseRspModel {
  int code = -1;
  String message = '';
  dynamic data;

  BaseRspModel(this.data);

  BaseRspModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  bool IsSuccess() {
    return code == 0;
  }
}
