import 'package:flutter/material.dart';
import 'package:wake_up/model/report_list.dart';

// 上报分组数据处理
class ReportProvider with ChangeNotifier {
  // 分组列表数据
  List<ReportModel> list = [];

  // 获取分组列表数据
  getList(List<ReportModel> l) {
    list = l;
    notifyListeners();
  }

  // 上拉加载列表，追加列表数据
  addList(List<ReportModel> l) {
    list.addAll(l);
    notifyListeners();
  }
}
