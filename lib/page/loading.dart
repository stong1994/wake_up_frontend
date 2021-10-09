import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wake_up/router/application.dart';

// 加载页面
class LoadingPage extends StatefulWidget {
  _LoadingPage createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // 加载页面停留2秒
    Future.delayed(Duration(seconds: 2), () {
      print('企业站启动');
      // 使用路由跳转至路由主界面
      Application.router.navigateTo(context, "/app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          // 加载页面居中背景图
//          Image.asset("assets/images/1.jpeg", fit: BoxFit.cover,)
          Text("梦醒APP")
        ],
      ),
    );
  }
}