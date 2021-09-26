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
  Color _col = Colors.red;
  double _radis = 0;

  @override
  Widget build(BuildContext context) {
    // print('BUILD METHOD');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 2000),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(_radis)),
                  color: _col,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_col == Colors.red) {
                      _col = Colors.blue;
                      _radis = 15;
                    } else {
                      _col = Colors.red;
                      _radis = 0;
                    }
                  });
                },
                child: Text('Animated Start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
