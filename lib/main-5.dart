import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
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

  bool switchW = false;
  String _selection = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          PopupMenuButton<dynamic>(
            onSelected: (dynamic result) {
              setState(() {
                _selection = result;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
              const PopupMenuItem<String>(
                value: 'OK',
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem<String>(
                value: 'No',
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem<String>(
                value: 'YES',
                child: Text('Being a self-starter'),
              ),
              const PopupMenuItem<String>(
                value: 'Better',
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Switch(
              value: switchW,
              onChanged: (val) {
                setState(() {
                  switchW = val;
                });
              },
            ),
            Text(_selection),
          ],
        ),
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            TextButton(onPressed: () {}, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
