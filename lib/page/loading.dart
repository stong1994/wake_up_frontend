import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wake_up/router/routes.dart';

// 启动App加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // 加载页面停留2秒
    Future.delayed(Duration(seconds: 2), () {
      print('企业站启动');
      // 使用路由跳转至路由主界面
      router.navigateTo(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            // 加载背景图
            // Image.asset('assets/images/1.jpeg', fit: BoxFit.fill,),
            // 加载页面文字内容
            Positioned(
              // 距离顶部100
              top: 100,
              child: Container(
                width: 400,
                child: Center(
                  child: Text(
                    '企业站',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
