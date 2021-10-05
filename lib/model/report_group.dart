// 上报分组返回数据模型
class ReportGroupListModel {
  int code;
  String message;
  List<ReportGroupModel> data;

  ReportGroupListModel(this.data);

  ReportGroupListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(ReportGroupModel.fromJson(v));
      });
    }
  }
}

// 上报分组数据模型
class ReportGroupModel {
  String id;
  String name;
  int count;

  ReportGroupModel({this.id, this.name});

  ReportGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['group_id'];
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['group_id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    return data;
  }
}