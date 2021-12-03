import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wake_up/page/app.dart';
import 'package:wake_up/page/report_group.dart';
import 'package:wake_up/page/report_list.dart';

import '../page/rethink_detail.dart';

// app页面
Handler appHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return App();
});

// 根路由Handler返回home页面
Handler reportGroupHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return ReportGroupPage();
    });

Handler reportListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return ReportListPage();
    });

// 反思详情路由Handler返回反思详情页面
Handler rethinkDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      var reportIDs = params['reportID'];
      String reportID = reportIDs != null ? reportIDs.first : '';
      var rethinkIDs = params['rethinkID'];
      String rethinkID = rethinkIDs != null ? rethinkIDs.first : '';
      var contents = params['content'];
      String content = contents != null ? contents.first : '';
      var times = params['createTime'];
      int createTime = int.parse((times != null ? times.first : '0'));
      return RethinkDetail(reportID, rethinkID, content, createTime);
    });
