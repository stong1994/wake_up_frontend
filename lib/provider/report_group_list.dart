import 'package:flutter/material.dart';

import '../model/report_group.dart';

// 上报分组数据处理
class ReportGroupProvider with ChangeNotifier {
  // 分组列表数据
  List<ReportGroupModel> groupList = [];

  // 获取分组列表数据
  getGroupList(List<ReportGroupModel> list) {
    groupList = list;
    notifyListeners();
  }

  // 上拉加载列表，追加列表数据
  addGroupList(List<ReportGroupModel> list) {
    groupList.addAll(list);
    notifyListeners();
  }
}
