import 'package:flutter/material.dart';

// import './decimal_to_roman.dart';
// import './roman_to_decimal.dart';
import './roman_conversion.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0xff3C3261);

  Widget createAppBar() {
    return new AppBar(
      elevation: 0.3,
      centerTitle: true,
      title: new Text(
        widget.title,
        style: new TextStyle(
          color: mainColor,
          fontFamily: 'Arvo',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        new Icon(
          Icons.menu,
          color: mainColor,
        ),
      ],
    );
  }

  Widget createBodyText() {
    return Flexible(
      child: new Text(
        'This app does many numeric conversions.',
        style: TextStyle(
          fontFamily: 'Arvo',
          fontWeight: FontWeight.bold,
          fontSize: 19.0,
        ),
        // textAlign: TextAlign.left,
      ),
    );
  }

  // Widget createDecimalToRomanButton() {
  //   return Container(
  //     child: RaisedButton(
  //       child: Text(
  //         'Convert Decimal to Roman',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
  //       color: Colors.lightGreen,
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => DecimalToRoman()),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget createRomanToDecimalButton() {
  //   return Container(
  //     child: RaisedButton(
  //       child: Text(
  //         'Convert Roman to Decimal',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
  //       color: Colors.lightGreen,
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => RomanToDecimal()),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget createRomanConversionButton() {
    return Container(
      child: RaisedButton(
        child: Text(
          'Roman Conversion',
          style: TextStyle(color: Colors.white),
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
        color: Colors.lightGreen,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RomanConversion()),
          );
        },
      ),
    );
  }

  Widget createBody() {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(30.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              createBodyText(),
            ],
          ),
        ),
        // new Container(
        //   padding: EdgeInsets.only(left: 30.0, right: 30.0),
        //   child: new Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       createDecimalToRomanButton(),
        //     ],
        //   ),
        // ),
        // new Container(
        //   padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        //   child: new Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       createRomanToDecimalButton(),
        //     ],
        //   ),
        // ),
        new Container(
          padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createRomanConversionButton(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(),
    );
  }
}
