import 'package:flutter/material.dart';
import '../widgets/helpers/convert_to_decimal.dart';

class RomanToDecimal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RomanToDecimalState();
  }
}

class _RomanToDecimalState extends State<RomanToDecimal> {
  String _dec = "";
  final myController = new TextEditingController();

  Widget createAppBar() {
    return AppBar(
      title: Text("Convert Roman Numeral to Decimal"),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  void submitConvertNumber(BuildContext context) {
    setState(() {
      var theRomanNum = myController.text;
      if (theRomanNum.length == 0) {
        _dec = "Enter a Roman Numeral.";
      } else {
        var dtr = new ConvertRomanToDecimal();
        var aa = dtr.romanToDecimal(theRomanNum);
        _dec = "$aa";
      }
    });
  }

  void submitClearNumber(BuildContext context) {
    setState(() {
      myController.text = "";
      _dec = "";
    });
  }

  Widget textboxEntryArea() {
    return new TextField(
      textInputAction: TextInputAction.go,
      decoration: new InputDecoration(
        labelText: "Enter a roman numeral",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      controller: myController,
      onChanged: (v) => setState(() {
            //_roman = v;
          }),
      keyboardType: TextInputType.number,
      style: new TextStyle(fontFamily: "Arvo"),
    );
  }

  Widget conversionResultAreaText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: new Text(
        "Decimal Value: ",
        style: TextStyle(
          fontSize: 25,
          color: hexToColor("#F2A03D"),
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget conversionResultAreaResult() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        _dec,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget convertButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitConvertNumber(context),
            color: Colors.lightGreen,
            child: Text(
              'Convert',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget clearButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitClearNumber(context),
            color: Colors.lightBlueAccent,
            child: Text(
              'Clear',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget buttonArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        convertButton(),
        clearButton(),
      ],
    );
  }

  Widget paddingEdgeInsetsTop(var number) {
    return new Padding(
      padding: EdgeInsets.only(top: number),
    );
  }

  Widget createConversionArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      // color: Colors.white,
      child: new Container(
        child: new Center(
          child: new Column(
            children: [
              paddingEdgeInsetsTop(40.0),
              new Text(
                'Enter a Roman Numeral.',
                style:
                    new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
              ),
              paddingEdgeInsetsTop(20.0),
              textboxEntryArea(),
              conversionResultAreaText(),
              conversionResultAreaResult(),
              buttonArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createBackButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('< Go Back'),
          ),
        ],
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        createConversionArea(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(context),
    );
  }
}
