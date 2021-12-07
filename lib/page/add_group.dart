import 'package:flutter/material.dart';

class AddGroupButton {
  AddGroupButton._privateConstructor();

  static final AddGroupButton _instance = AddGroupButton._privateConstructor();

  factory AddGroupButton() {
    return _instance;
  }

  late OverlayEntry entry;

  void Display(BuildContext context) {
    entry = makeAddGroupButtonButton(context);
    Overlay.of(context)?.insert(entry);
  }

  void Hidden() {
    entry.remove();
  }
}

OverlayEntry makeAddGroupButtonButton(BuildContext context) {
  return new OverlayEntry(builder: (context) {
    return new Positioned(
        top: kToolbarHeight,
        right: 20,
        width: 200,
        height: 80,
        child: new SafeArea(
            child: new Material(
          child: new Container(
            color: Colors.black,
            child: new Column(
              children: <Widget>[
                Expanded(
                  child: new ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: new Text(
                      "添加分组",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  });
}
