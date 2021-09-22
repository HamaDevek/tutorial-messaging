import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getDataFromApi();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // print('BUILD METHOD');
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  onChanged: (numb) {
                    try {
                      setState(() {
                        datas = [
                          ...datas
                              .where((item) => item['id'] == int.parse(numb))
                        ];
                      });
                    } catch (e) {
                      print('Hich nabu');
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              isLoading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : datas.length == 0
                      ? TextButton(
                          onPressed: () {
                            getDataFromApi();
                          },
                          child: Text(
                            'Try Again !',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                      : Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onDoubleTap: () {
                                    if (mounted) {
                                      setState(() {
                                        datas.removeAt(index);
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Deleted Item ID:#${datas[index]['id']}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                      ));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: Text(
                                      '#${datas[index]['id']} : ${datas[index]['title']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                );
                              },
                              itemCount: datas.length,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.delete),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Title'),
                  content: Text("Are sure delete all item ?"),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text(
                        "Delete All",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        if (mounted) {
                          setState(() {
                            datas.clear();
                          });
                        }
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }

  void getDataFromApi() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    var client = http.Client();
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        setState(() {
          datas = [...jsonDecode(response.body)];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Got data fom Api Succussfully',
              style: TextStyle(fontSize: 20),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
        // print(datas.first);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error : $e',
            style: TextStyle(fontSize: 20),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      print(e);
      client.close();
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
