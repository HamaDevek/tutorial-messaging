import 'dart:io';

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
  List datas = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  var selectedTime = showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  );
                  selectedTime.then((value) {
                    print(value);
                  });
                },
                child: Text("Time Picker"),
              ),
              TextButton(
                onPressed: () {
                  var selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)));
                  selectedDate.then((value) {
                    print(value);
                  });
                },
                child: Text("Date Picker"),
              ),
              TextButton(
                onPressed: () {
                  print(Platform.isAndroid);
                },
                child: Text("Get Device"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
