import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var list = ['Rupees', 'Dollars', 'Pounds'];
  String defaultValue = 'Rupees';
  String result = '';
  double amount;
  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController term = TextEditingController();

  var formkey = GlobalKey<FormState>();
  String calculateAmount() {
    if (defaultValue == list[0]) {
      amount = (double.parse(principal.text) *
              double.parse(rate.text) *
              double.parse(term.text)) /
          100;
      return 'Your Interest is $amount Rupees';
    } else if (defaultValue == list[1]) {
      double dollar = double.parse(principal.text) / 68.45;
      amount =
          (dollar * double.parse(rate.text) * double.parse(term.text)) / 100;
      double amount1 = double.parse(amount.toStringAsFixed(2));
      return 'Your Interest is $amount1 Dollars';
    } else if (defaultValue == list[2]) {
      double dollar = double.parse(principal.text) / 85.71;
      amount =
          ((dollar * double.parse(rate.text) * double.parse(term.text)) / 100);
      double amount1 = double.parse(amount.toStringAsFixed(2));
      return 'Your Interest is $amount1 Pounds';
    }

    return '';
  }

  void reset() {
    principal.text = '';
    rate.text = '';
    term.text = '';
    defaultValue='Rupees';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest Calculator App'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 206.0,
                    height: 206.0,
                    scale: 2.0,
                  )),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: principal,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter the Principal';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter principal in rupees eg.20000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: rate,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter the rate';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Rate',
                    hintText: 'Enter Rate in Percent',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: term,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter the term';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Enter Term in Years',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: DropdownButton(
                      items: list.map((String dropButtonItem) {
                        return DropdownMenuItem(
                          value: dropButtonItem,
                          child: Text(dropButtonItem),
                        );
                      }).toList(),
                      value: defaultValue,
                      onChanged: (String changedValue) {
                        setState(() {
                          defaultValue = changedValue;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 2.0,
                      onPressed: () {
                        setState(() {
                          if (formkey.currentState.validate()) {
                            result = calculateAmount();
                          }
                        });
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        reset();
                        setState(() {
                          result = '';
                        });
                      },
                      child: Text('Reset', style: TextStyle(fontSize: 18.0)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '$result',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
