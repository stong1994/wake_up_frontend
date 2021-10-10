import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wake_up/model/base_resp.dart';
import 'package:wake_up/model/report_group.dart';
import 'package:wake_up/provider/report_group_list.dart';
import 'package:wake_up/service/http_service.dart';

import '../conf/configure.dart';
import 'button.dart';

// 分组列表项
Widget _groupListWidget(String userID, List<ReportGroupModel> groupList) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0),
              itemCount: groupList.length,
              itemBuilder: (_, i) => SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ElevatedButton(
//                    padding: const EdgeInsets.all(8.0),
                      onPressed: () {
                        // 增加report
                        addReport(userID, groupList[i].id);
                      },
                      child: Text(
                        groupList[i].name.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      style: ButtonStyle(
//                      backgroundColor: MaterialStateProperty.all<Color>(groupList[i].bg),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ))),
    ],
  );
}

class ReportGroupPage extends StatefulWidget {
  String userID = "123";

  @override
  _ReportGroupPageState createState() => new _ReportGroupPageState();
}

class _ReportGroupPageState extends State<ReportGroupPage> {
  List<Button> buttonsList = [];

  @override
  void initState() {
    super.initState();
    // 首次进入页面，加载分组列表
    getReportGroupList(false);
  }

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Consumer<ReportGroupProvider>(
          // 使用Consumer获取ReportGroupProvider对象
          builder: (_, ReportGroupProvider groupProvider, __) {
            //获取分组列表数据
            List<ReportGroupModel> groupList = groupProvider.groupList;
            // 判断是否有数据
            if (groupList.length > 0) {
              return Flexible(
                fit: FlexFit.loose,
                child: _groupListWidget(widget.userID, groupList),
              );
            }
            return Text("无数据");
          },
        )
      ],
    );
  }
}

void addReport(String userID, String groupID) async {
  var url = 'http://' + Config.IP + ":" + Config.PORT + "/api/report";
  var params = {
    "user_id": userID,
    "group_id": groupID,
  };
  await postRequest(url, body: params).then((value) {
    var data = json.decode(value.toString());
    BaseRspModel respModel = BaseRspModel.fromJson(data);
    if (!respModel.IsSuccess()) {
      print("not success");
    }
  });
}