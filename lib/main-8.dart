import 'dart:io';

import 'package:firstproject1/show%20_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // print('BUILD METHOD');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: 'tag',
                  child: Image.network(
                      'https://upload-wikimedia-org.translate.goog/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/330px-Google_Images_2015_logo.svg.png?_x_tr_sl=en&_x_tr_tl=ar&_x_tr_hl=en-US&_x_tr_pto=elem')),
              TextButton(
                  onPressed: () {
                    sleep(Duration(seconds: 3));
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShowImage()),
                    );
                  },
                  child: Text('Go')),
            ],
          ),
        ),
      ),
    );
  }
}
