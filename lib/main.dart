import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '梦醒'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _attachmentCounter = 0; // 贪
  int _angerCounter = 0; // 嗔
  int _delusionCounter = 0; // 痴
  int _prideCounter = 0; // 慢
  int _jealousyCounter = 0; // 疑

  void _incrementAttachmentCounter() {
    setState(() {
      _attachmentCounter++;
    });
  }

  void _incrementAngerCounter() {
    setState(() {
      _angerCounter++;
    });
  }

  void _incrementDelusionCounter() {
    setState(() {
      _delusionCounter++;
    });
  }

  void _incrementPrideCounter() {
    setState(() {
      _prideCounter++;
    });
  }

  void _incrementJealousyCounter() {
    setState(() {
      _jealousyCounter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // 列表展示
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("贪"),
            subtitle: Text(_attachmentCounter.toString()),
            onTap: (){
              _incrementAttachmentCounter();
            },
          ),
          ListTile(
            title: Text("嗔"),
            subtitle: Text(_angerCounter.toString()),
            onTap: (){
              _incrementAngerCounter();
            },
          ),
          ListTile(
            title: Text("痴"),
            subtitle: Text(_delusionCounter.toString()),
            onTap: (){
              _incrementDelusionCounter();
            },

          ),
          ListTile(
            title: Text("慢"),
            subtitle: Text(_prideCounter.toString()),
            onTap: (){
              _incrementPrideCounter();
            },
          ),
          ListTile(
            title: Text("疑"),
            subtitle: Text(_jealousyCounter.toString()),
            onTap: (){
              _incrementJealousyCounter();
            },
          ),
        ],
      ),
    );
  }
}
