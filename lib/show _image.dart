import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
              tag: 'tag',
              child: Image.network(
                'https://upload-wikimedia-org.translate.goog/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/330px-Google_Images_2015_logo.svg.png?_x_tr_sl=en&_x_tr_tl=ar&_x_tr_hl=en-US&_x_tr_pto=elem',
                width: 100,
              ))
        ],
      ),
    );
  }
}
