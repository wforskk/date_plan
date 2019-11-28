import 'package:flutter/material.dart';
import 'package:date_plan/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final int maxLength = 10;

  void initState() {
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
    var deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var deviceHeight = deviceData.size.height; //デバイスの高さを取得
    return Scaffold(
      appBar: AppBar(
        title: Text('検索画面'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                height: 50,
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
                                    fontSize: 13.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ))),
                    ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                height:40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _createFlat()
                ),
              ),
              Container(
                //Columnは高さを指定しないとだめっぽい、だからContainerで高さを指定する。
                height: deviceHeight * 0.7,
                //alignment: Alignment.center,子の幅と高さに合わせてくれる
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(1.0),
                  children: _createSmallDatePlan(context),
                ),
              ),

            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _createSmallDatePlan(context) {
    var _widget = <Widget>[];
    for (int _i = 0; _i < 20; _i++) {
      _widget.add(
        Container(
          child: Hero(
            tag: 'date' + _i.toString(),
            child: RaisedButton(
              padding: EdgeInsets.all(2.0),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
              ),
              elevation: 10,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Image.asset(
                      'images/image1.jpg',
                      height: 60,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "水と生命の神秘に",
                          style: TextStyle(
                              fontSize: 7.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          "きらめくひとときを！",
                          style: TextStyle(
                              fontSize: 7.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
          ),
        ),
      );
    }
    return _widget;
  }
  List<Widget> _createFlat() {
    var _widget = <Widget>[];
    for (int _i = 0; _i < 9; _i++) {
      _widget.add(
        Container(
          padding: EdgeInsets.fromLTRB(0.1, 0, 0.1, 0),
          child:
          FlatButton(
            textColor: Colors.black,
            splashColor: Colors.orange[100],
            color: Colors.blueAccent,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.elliptical(0, 0)),
            ),
            child: Container(
              child: Text(
                "ボタン" + _i.toString(),
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
        ),
      );
    }
    return _widget;
  }


  void buttonPressed() {}
}
