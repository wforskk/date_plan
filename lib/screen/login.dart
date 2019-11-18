import 'package:flutter/material.dart';
import 'package:date_plan/screen/search_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Color> _colorList = [Colors.blue[300],Colors.blue[800]];
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var _deviceHeight = _deviceData.size.height; //デバイスの高さを取得
    var _deviceWidth = _deviceData.size.width; //デバイスの高さを取得
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.35,
          width: _deviceWidth * 0.75,
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: _colorList,
            ),

          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                children : <Widget>[
                  Container(
                    width: 95.0,
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Account：",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  SizedBox(
                  width: 150.0,
                  height: 30.0,
                  child: TextField(
                    //controller: _controller,
                    decoration:
                    InputDecoration(border: OutlineInputBorder()),
                    //maxLength: maxLength,
                    //maxLengthEnforced: true,
                    //expands: true,
                  ),
                ),
                ],
              ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children : <Widget>[
                    Container(
                      width: 95.0,
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "pass：",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 30.0,
                      child: TextField(
                        //controller: _controller,
                        decoration:
                        InputDecoration(border: OutlineInputBorder()),
                        //maxLength: maxLength,
                        //maxLengthEnforced: true,
                        //expands: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  color: Colors.blue[100],
                  splashColor: Colors.orangeAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20, 20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );},
                  child: Text(
                    "login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buttonPressed() {}
}
