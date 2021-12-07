import 'package:flutter/material.dart';
import 'package:wake_up/page/report_button.dart';
import 'package:wake_up/page/report_list.dart';

// 主页面
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // 当前选中页面索引
  var currentIndex = 0;

  // 分组页面
  late ReportGroupPage reportGroup;

  // 上报列表页面
  late ReportListPage reportList;

  // 根据当前索引返回不同得页面
  currentPage() {
    switch (currentIndex) {
      case 0:
        reportGroup = ReportGroupPage();
        return reportGroup;
      case 1:
        reportList = ReportListPage();
        return reportList;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('梦醒'),
      ),
      // 底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // 当前页面索引
          currentIndex: currentIndex,
          onTap: ((index) {
            setState(() {
              currentIndex = index;
            });
          }),
          // 底部导航按钮
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "列表"),
          ]),
      // 中间显示当前页
      body: currentPage(),
    );
  }
}
