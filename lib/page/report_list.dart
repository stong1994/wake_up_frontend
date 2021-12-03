import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wake_up/conf/configure.dart';
import 'package:wake_up/model/report_list.dart';
import 'package:wake_up/provider/report_list.dart';
import 'package:wake_up/service/http_service.dart';

import 'login.dart';

class ReportListPage extends StatefulWidget {
  late String authToken;

  void initState() async {
    User user = User();
    authToken = await user.getAuthToken();
  }

  @override
  _ReportListPageState createState() => new _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  void initState() {
    super.initState();
    // 首次进入页面，加载分组列表
    getReportList(false);
  }

//  GlobalKey<RefreshFooterState> footerKey = GlobalKey<RefreshFooterState>();

  // 滚动控制
//  var scrollController = ScrollController();

  void getReportList(bool isMore) async {
    var url = 'http://' + Config.IP + ":" + Config.PORT + "/api/report/all";
    var params = {"page_no": 1, "page_size": 10};
    await getRequest(url, params: params, authToken: widget.authToken)
        .then((value) {
      var data = json.decode(value.toString());
      print('report数据:::' + data.toString());
      ReportListModel reportListModel = ReportListModel.fromJson(data);
      if (isMore) {
        Provider.of<ReportProvider>(context).addList(reportListModel.data);
      } else {
        Provider.of<ReportProvider>(context, listen: false)
            .getList(reportListModel.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Consumer<ReportProvider>(
          builder: (BuildContext context, ReportProvider provider, __) {
            //获取分组列表数据
            List<ReportModel> list = provider.list;
            // 判断是否有数据
            if (list.length > 0) {
              return Flexible(
                fit: FlexFit.loose,
                child: _reportListWidget(list),
              );
            }
            return Text("无数据");
          },
        )
      ],
    );
  }
}

Widget _reportListWidget(List<ReportModel> list) {
  return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: list.length,
      itemBuilder: (_, i) => Row(
            children: [
              Expanded(
                  child: Text(
                list[i].content,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                list[i].groupName,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                formatDate(
                        DateTime.fromMillisecondsSinceEpoch(
                            list[i].reportTime * 1000),
                        [yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", "ss"])
                    .toString(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                textAlign: TextAlign.center,
              )),
            ],
          ));
}
