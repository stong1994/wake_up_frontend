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
  String reportID = params['reportID'].first;
  String rethinkID = params['rethinkID'].first;
  String content = params['content'].first;
  int createTime = int.parse(params['createTime'].first);
  return RethinkDetail(reportID, rethinkID, content, createTime);
});
