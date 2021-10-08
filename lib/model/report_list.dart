// 上报分组返回数据模型
class ReportListModel {
  int code = 0;
  String message = '';
  List<ReportModel> data = [];

  ReportListModel(this.data);

  ReportListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(ReportModel.fromJson(v));
      });
    }
  }
}

// 上报数据模型
class ReportModel {
  String id = '';
  String content = '';
  int reportTime = 0;
  String groupID = '';
  String groupName = '';

  ReportModel(
      {this.id = '',
      this.content = '',
      this.reportTime = 0,
      this.groupID = '',
      this.groupName = ''});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    groupID = json['group_id'];
    groupName = json['group_name'];
    reportTime = json['report_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['report_time'] = this.reportTime;
    data['group_id'] = this.groupID;
    data['group_name'] = this.groupName;
    return data;
  }
}
