import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var _deviceHeight = _deviceData.size.height; //デバイスの高さを取得
    var _deviceWidth = _deviceData.size.width; //デバイスの高さを取得
    return Scaffold(
      appBar: AppBar(
        title: Text('詳細'),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'date',
            child:
            Container(
              child: Image.asset(
                'images/autumn3.jpg',
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "文章",
              style: TextStyle(
                  fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
            ),
          ),

        ],
      ),
    );
  }

}
