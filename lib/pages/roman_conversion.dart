import 'package:flutter/material.dart';
import 'package:supacentre_app/widgets/helpers/convert_to_decimal.dart';
import '../widgets/helpers/convert_to_roman.dart';

class RomanConversion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RomanConversionState();
  }
}

class _RomanConversionState extends State<RomanConversion> {
  String _roman = "";
  String _dec = "";

  Widget createAppBar() {
    return AppBar(
      title: Text("Roman Numeral Conversion"),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  final myDecController = new TextEditingController();
  final myRomanController = new TextEditingController();

  void submitConvertNumber(BuildContext context) {
    setState(() {
      var theNum = myDecController.text;
      if (theNum.length == 0) {
        _roman = "Enter a Number.";
      } else {
        var dtr = new ConvertDecimalToRoman();
        var aa = dtr.decimalToRoman(int.tryParse(theNum));
        _roman = "$aa";
      }
    });
  }

  void submitConvertRoman(BuildContext context) {
    setState(() {
      var theNum = myRomanController.text;
      if (theNum.length == 0) {
        _dec = "Enter a Roman Numeral.";
      } else {
        var dtr = new ConvertRomanToDecimal();
        var aa = dtr.romanToDecimal(theNum);
        _dec = "$aa";
      }
    });
  }

  void submitClearNumber(BuildContext context) {
    setState(() {
      myDecController.text = "";
      _roman = "";
    });
  }

  void submitClearRoman(BuildContext context) {
    setState(() {
      myRomanController.text = "";
      _dec = "";
    });
  }

  Widget textboxDecimalEntryArea() {
    return new Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new TextField(
        textInputAction: TextInputAction.go,
        decoration: new InputDecoration(
          labelText: "Enter a decimal number",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        controller: myDecController,
        onChanged: (v) => setState(() {
              //_roman = v;
            }),
        keyboardType: TextInputType.number,
        style: new TextStyle(fontFamily: "Arvo"),
      ),
    );
  }

  Widget textboxRomanEntryArea() {
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
      controller: myRomanController,
      onChanged: (v) => setState(() {
            //_roman = v;
          }),
      keyboardType: TextInputType.number,
      style: new TextStyle(fontFamily: "Arvo"),
    );
  }

  Widget conversionDecimalResultAreaText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: new Text(
        "Roman Value: ",
        style: TextStyle(
          fontSize: 25,
          color: hexToColor("#F2A03D"),
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget conversionRomanResultAreaText() {
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

  Widget conversionDecimalResultAreaResult() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        _roman,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget conversionRomanResultAreaResult() {
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

  Widget convertDecimalButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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

  Widget convertRomanButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitConvertRoman(context),
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

  Widget clearDecimalButton() {
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

  Widget clearRomanButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitClearRoman(context),
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

  Widget decimalButtonArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        convertDecimalButton(),
        clearDecimalButton(),
      ],
    );
  }

  Widget romanButtonArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        convertRomanButton(),
        clearRomanButton(),
      ],
    );
  }

  Widget paddingEdgeInsetsTop(var number) {
    return new Padding(
      padding: EdgeInsets.only(top: number),
    );
  }

  Widget createDecimalConversionArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // color: Colors.white,
      child: new Container(
        child: new Center(
          child: new Column(
            children: [
              paddingEdgeInsetsTop(20.0),
              new Text(
                'Enter a Decimal Number.',
                style:
                    new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
              ),
              paddingEdgeInsetsTop(20.0),
              textboxDecimalEntryArea(),
              conversionDecimalResultAreaText(),
              conversionDecimalResultAreaResult(),
              decimalButtonArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createRomanConversionArea(BuildContext context) {
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
              textboxRomanEntryArea(),
              conversionRomanResultAreaText(),
              conversionRomanResultAreaResult(),
              romanButtonArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        createDecimalConversionArea(context),
        createRomanConversionArea(context)
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
