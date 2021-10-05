import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:wake_up/model/report_group.dart';
import 'package:wake_up/provider/report_group_list.dart';
import 'package:wake_up/router/routes.dart';
import 'package:wake_up/service/http_service.dart';
import 'package:wake_up/style/color.dart';
import 'package:wake_up/style/font.dart';

import '../conf/configure.dart';
import 'button.dart';

class HomePage extends StatefulWidget {
  String userID = "123";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Button> buttonsList;

  @override
  void initState() {
    super.initState();
    // 首次进入页面，加载分组列表
    getReportGroupList(false);
  }

  GlobalKey<RefreshFooterState> footerKey = GlobalKey<RefreshFooterState>();

  // 滚动控制
  var scrollController = ScrollController();

  void getReportGroupList(bool isMore) async {
    var url =
        'http://' + Config.IP + ":" + Config.PORT + "/api/report/group/list";
    var params = {"user_id": widget.userID};
    print('user_id' + widget.userID);
    await getRequest(url, params: params).then((value) {
      var data = json.decode(value.toString());
      print('详情数据:::' + data.toString());
      ReportGroupListModel reportGroupListModel =
          ReportGroupListModel.fromJson(data);
      if (reportGroupListModel == null) {
        Provider.of<ReportGroupProvider>(context).getGroupList([]);
      } else {
        if (isMore) {
          Provider.of<ReportGroupProvider>(context)
              .addGroupList(reportGroupListModel.data);
        } else {
          Provider.of<ReportGroupProvider>(context, listen: false)
              .getGroupList(reportGroupListModel.data);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("人生就是一场梦醒"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Consumer<ReportGroupProvider>(
                // 使用Consumer获取ReportGroupProvider对象
                builder: (BuildContext ctx, ReportGroupProvider groupProvider,
                    Widget child) {
              //获取分组列表数据
              List<ReportGroupModel> groupList = groupProvider.groupList;
              // 判断是否有数据
              if (groupList.length > 0) {
                return Container(
                  width: 400,
                  //加载刷新组件
                  child: EasyRefresh(
                    //底部上拉加载处理
                    refreshFooter: ClassicsFooter(
                      key: footerKey,
                      bgColor: Colors.white,
                      textColor: Color.fromRGBO(132, 95, 63, 1.0),
                      moreInfoColor: Color.fromRGBO(132, 95, 63, 1.0),
                      showMore: true,
                      noMoreText: '加载更多',
                      moreInfo: '加载中',
                      //'加载中',
                      loadReadyText: '上拉加载', //'上拉加载',
                    ),
                    //数据列表
                    child: ListView.builder(
                      //滚动控制
                      controller: scrollController,
                      //列表长度
                      itemCount: groupList.length,
                      //列表项构造器
                      itemBuilder: (context, index) {
                        //列表项
                        return _ListWidget(groupList, index);
                      },
                    ),
                    //加载更多
                    loadMore: () async {
                      getReportGroupList(true);
                    },
                  ),
                );
              } else {
                return Text("无数据");
              }
            })
          ],
        ));
  }

  // 分组列表项
  Widget _ListWidget(List newList, int index) {
    //根据索引获取产品数据
    ReportGroupModel item = newList[index];

    return InkWell(
      onTap: () {
        //路由跳转至产品详情页
        router.navigateTo(context, "/report/group/detail?group_id=${item.id}");
      },
      //列表项背景
      child: Container(
        color: ReportGroupColors.bgColor,
        padding: EdgeInsets.only(
          top: 5.0,
          right: 5.0,
        ),
        //水平布局
        child: Row(
          children: <Widget>[
            //产品图片
//            Image.network(
//              item.imageUrl,
//              width: 120.0,
//              height: 120.0,
//            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: ReportGroupColors.divideLineColor,
                ))),
                //产品信息垂直布局
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //产品描述
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //水平布局
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        //产品类型
                        Text(
                          item.count.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: ReportGroupColors.typeColor,
                          ),
                        ),
                        //产品按钮
                        Container(
                          child: Text(
                            "+1",
                            style: TextStyle(
                              color: ReportGroupColors.piontColor,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: ReportGroupColors.piontColor)),
                        ),
                      ],
                    ),
                    //产品名称
                    Text(
                      item.name,
                      style: Fonts.itemNameStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
