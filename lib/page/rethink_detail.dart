import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class RethinkDetail extends StatelessWidget {
  String reportID;
  String rethinkID;
  String content;
  int createTime;

  RethinkDetail(this.reportID, this.rethinkID, this.content, this.createTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 左侧空余
          Expanded(
            child: Container(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  formatDate(DateTime.fromMicrosecondsSinceEpoch(createTime),
                      [HH, ':', nn, ':', ss]),
                  style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(content),
              )
            ],
          ),
          // 头像
//          Container(
//            margin: const EdgeInsets.only(left: 16),
//            child: CircleAvatar(
//              child: Text('Me'),
//            ),
//          )
        ],
      ),
    );
  }
}
