import 'package:flutter/material.dart';
import '../widgets/helpers/convert_to_roman.dart';

class DecimalToRoman extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecimalToRomanState();
  }
}

class _DecimalToRomanState extends State<DecimalToRoman> {
  String _roman = "";

  Widget createAppBar() {
    return AppBar(
      title: Text("Convert Decimal to Roman Numeral"),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  final myController = new TextEditingController();

  void submitConvertNumber(BuildContext context) {
    setState(() {
      var theNum = myController.text;
      if (theNum.length == 0) {
        _roman = "Enter a number.";
      } else {
        var dtr = new ConvertDecimalToRoman();
        var aa = dtr.decimalToRoman(int.tryParse(theNum));
        _roman = "$aa";
      }
    });
  }

  void submitClearNumber(BuildContext context) {
    setState(() {
      myController.text = "";
      _roman = "";
    });
  }

  Widget textboxEntryArea() {
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
        controller: myController,
        onChanged: (v) => setState(() {
              //_roman = v;
            }),
        keyboardType: TextInputType.number,
        style: new TextStyle(fontFamily: "Arvo"),
      ),
    );
  }

  Widget conversionResultAreaText() {
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

  Widget conversionResultAreaResult() {
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

  Widget convertButton() {
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
        // createBackButton(context),
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
