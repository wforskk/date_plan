import 'package:flutter/material.dart';
import 'package:date_plan/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final int maxLength = 10;
  var contextLocal;

  var _gridData = <Widget>[
    Container(
      color: Colors.red,
      child: Text(
        "One",
        style: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Text(
        "two",
        style: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
      ),
    ),
  ];

  void initState() {
    contextLocal = null;
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    contextLocal = context;
    var deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var deviceHeight = deviceData.size.height; //デバイスの高さを取得
    return Scaffold(
      appBar: AppBar(
        title: Text('検索画面'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              height: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 200.0,
                        child: TextField(
                          //controller: _controller,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          //maxLength: maxLength,
                          //maxLengthEnforced: true,
                          //expands: true,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FlatButton(
                            onPressed: buttonPressed,
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "検索",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ))),
                  ]),
            ),
            Container(
              //Columnは高さを指定しないとだめっぽい、だからContainerで高さを指定する。
              height: deviceHeight * 0.7,
              //alignment: Alignment.center,子の幅と高さに合わせてくれる
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Container(
                    child: Hero(
                      tag: 'date',
                      child: RaisedButton(
                        color: Colors.blue[100],
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/autumn3.jpg',
                              ),
                            ),
                            Container(
                              child: Text(
                                "タイトル",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            contextLocal,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Hero(
                      tag: 'date2',
                      child: RaisedButton(
                        color: Colors.blue[100],
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/bridg.jpg',
                              ),
                            ),
                            Container(
                              child: Text(
                                "タイトル",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            contextLocal,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  void buttonPressed() {}
}
