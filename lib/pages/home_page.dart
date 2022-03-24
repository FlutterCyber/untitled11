import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Log out'),
            content: Text('Are you sure want to log out'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Confirm'),
              ),
            ],
          );
        });
  }
  iosDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Log out"),
          content: Text('Are you sure want to log out'),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text("Confirm"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          color: Colors.red,
          child: FlatButton(
            onPressed: () {
              if (Platform.isAndroid) {
                androidDialog();
                print('Android');
              } else if (Platform.isIOS) {
                iosDialog();
                print('IOS');
              }
            },
            child: const Text(
              'Alert dialog',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
