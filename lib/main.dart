import 'package:flutter/material.dart';

//import 'loading.dart';
import 'package:provider/provider.dart';
import 'package:wake_up/page/loading.dart';
import 'package:wake_up/provider/report_group_list.dart';

import 'provider/current_index_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 配置路由
//    Routes.init();
    // 管理多个共享数据类
    return MultiProvider(
      providers: [
        // 主页
        ChangeNotifierProvider(
          create: (_) => CurrentIndexProvider(),
        ),
        // 分组列表
        ChangeNotifierProvider(create: (_) => ReportGroupProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter实战',
        // 自定义主题
        theme: mDefaultTheme,
        // 生成路由得回调函数，当导航到目标路由时，会使用这个来生成界面
//        onGenerateRoute: Application().router.generator,
        // 指定加载路面
        home: LoadingPage(),
      ),
    );
  }
}

// 自定义主题
final ThemeData mDefaultTheme = ThemeData(primaryColor: Colors.redAccent);
