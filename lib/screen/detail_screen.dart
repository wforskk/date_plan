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
            tag: 'date4',
            child: Container(
              child: Image.asset(
                'images/image1.jpg',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "   水と生命の神秘に\nきらめくひとときを！\n「アクアパーク品川」",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "都心にいながら楽しめるこの水族館は、まるで年中イルミネーションをみているかのようなライトアップと、"
                      "遊園地のようなアトラクション、神秘的な生き物をみることができ、デートの雰囲気にぴったりです！"
                      "お酒と共にまったりデートはいかがですか？",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
