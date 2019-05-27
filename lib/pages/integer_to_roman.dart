import 'package:flutter/material.dart';

class IntegerToRoman extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntegerToRomanState();
  }
}

class _IntegerToRomanState extends State<IntegerToRoman> {
  String _roman = "initial";

  Widget createAppBar() {
    return AppBar(
      title: Text("Convert Number to Roman Numeral"),
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
        _roman = "Please enter a number.";
      } else {
        _roman = "Now now";
      }
    });
  }

  void submitClearNumber(BuildContext context) {
    setState(() {
      myController.text = "";
    });
  }

  Widget createConversionArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      color: Colors.white,
      child: new Container(
        child: new Center(
          child: new Column(
            children: [
              new Padding(
                padding: EdgeInsets.only(top: 40.0),
              ),
              new Text(
                'Please enter a number.',
                style:
                    new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 40.0),
              ),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Enter a number",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                controller: myController,
                // onChanged: (v) => myController.text = v,
                onChanged: (v) => setState(() {
                      _roman = v;
                    }),
                // validator: (val) {
                // if (val.length == 0) {
                // return "The number cannot be empty";
                // } else {
                // return null;
                // }
                // },
                keyboardType: TextInputType.number,
                style: new TextStyle(fontFamily: "Arvo"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "Roman Value: ",
                  style: TextStyle(
                    fontSize: 18,
                    color: hexToColor("#F2A03D"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  _roman,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitConvertNumber(context),
                      color: Colors.indigoAccent,
                      child: Text(
                        'Convert Number',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitClearNumber(context),
                      color: Colors.indigoAccent,
                      child: Text(
                        'Clear Number',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
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
        createBackButton(context),
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
