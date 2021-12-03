import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'route_handler.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    // 路径没有找到Handler
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print('error::: router没有找到');
      return Text("not found router");
    });
    // 定义反思详情路由Handler
    router.define('/rethink/detail', handler: rethinkDetailHandler);
    // 定义根路由Handler
    router.define('/', handler: appHandler);
    router.define('/app', handler: appHandler);
    router.define('/report_group', handler: reportGroupHandler);
    router.define('/report_list', handler: reportListHandler);
  }
}
