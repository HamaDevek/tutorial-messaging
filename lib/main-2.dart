import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    getCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GridView.builder(
            itemBuilder: (context, index) {
              return Container(
                child: Text("$index"),
                color: Colors.red,
              );
            },
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 0.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.plus_one),
        onPressed: () {
          setState(() {
            counter++;
          });
          saveCounter();
          if (counter == 100) {
            setState(() {
              counter = 0;
            });
            removeCounter();
          }
        },
      ),
    );
  }

  void saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
    print("Saved");
    // prefs.clear();
    // prefs.containsKey('key');
    // bool? dark = prefs.getBool('key');
    // String? token = prefs.getString('key');
  }

  void getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  void removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');
  }
}
