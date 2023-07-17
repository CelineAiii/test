// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

void alertDialogtextField(BuildContext context) async {
  String inputData = '';
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('編輯運動紀錄'),
        content: new Row(children: <Widget>[
          new Expanded(
              child: new TextField(
            autofocus: true,
            decoration: new InputDecoration(
                labelText: '輸入新的時數或距離', hintText: '請輸入時數或距離...'),
            onChanged: (value) {
              inputData = value;
            },
          ))
        ]),
        actions: <Widget>[
          TextButton(
            child: Text('送出'),
            onPressed: () {
              Navigator.of(context).pop(inputData);
            },
          ),
        ],
      );
    },
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
