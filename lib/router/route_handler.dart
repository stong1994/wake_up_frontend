import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wake_up/page/home_page.dart';

import '../page/rethink_detail.dart';

// 根路由Handler返回home页面
Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

// 反思详情路由Handler返回反思详情页面
Handler rethinkDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
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
