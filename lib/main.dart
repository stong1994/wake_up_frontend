import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wake_up/page/app.dart';
//import 'package:wake_up/page/loading2.dart';
import 'package:wake_up/provider/report_group_list.dart';
import 'package:wake_up/provider/report_list.dart';
import 'package:wake_up/router/application.dart';
import 'package:wake_up/router/routes.dart';

import 'provider/current_index_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 注册路由
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.Init(router);

    // 管理多个共享数据类
    return MultiProvider(
      providers: [
        // 主页
        ChangeNotifierProvider(create: (_) => CurrentIndexProvider()),
        // 分组列表
        ChangeNotifierProvider(create: (_) => ReportGroupProvider()),
        ChangeNotifierProvider(create: (_) => ReportProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter实战',
        // 自定义主题
        theme: mDefaultTheme,
        // 生成路由得回调函数，当导航到目标路由时，会使用这个来生成界面
//        onGenerateRoute: Application().router.generator,
        // 指定加载路面
        home: App(),
      ),
    );
  }
}

// 自定义主题
final ThemeData mDefaultTheme = ThemeData(primaryColor: Colors.redAccent);
