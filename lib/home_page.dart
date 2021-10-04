import 'dart:math';

import 'package:flutter/material.dart';

import 'button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Button> buttonsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<Button> doInit() {
    var buttons = <Button>[
      new Button(id: 1),
      new Button(id: 2),
      new Button(id: 3),
      new Button(id: 4),
      new Button(id: 5),
      new Button(id: 6),
      new Button(id: 7),
      new Button(id: 8),
      new Button(id: 9),
    ];
    return buttons;
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
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ElevatedButton(
//                    padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      setState(() { // 这个要加，否则看不到数据刷新
                        buttonsList[i].num++;
                      });
                    },
                    child: Text(
                      buttonsList[i].num.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(buttonsList[i].bg),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
//                    disabledColor: buttonsList[i].bg,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
