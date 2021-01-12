import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Test Nusantech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int total = 0;
  bool error = false;
  List<bool> value = [false, false, false];

  TextEditingController _input1Controller =
      new TextEditingController(text: '0');
  TextEditingController _input2Controller =
      new TextEditingController(text: '0');
  TextEditingController _input3Controller =
      new TextEditingController(text: '0');

  void _calculate(String type) {
    total = 0;
    List input = [];

    if (value[0]) input.add(int.parse(_input1Controller.text.trim()));
    if (value[1]) input.add(int.parse(_input2Controller.text.trim()));
    if (value[2]) input.add(int.parse(_input3Controller.text.trim()));
    if (value.where((val) => val == true).length > 1) {
      switch (type) {
        case '+':
          {
            for (var i = 0; i < input.length; i++) {
              total = total + input[i];
            }
          }
          break;
        case '-':
          {
            total = input[0];
            for (var i = 1; i < input.length; i++) {
              total = total - input[i];
            }
          }
          break;
        case '*':
          {
            total = 1;
            for (var i = 0; i < input.length; i++) {
              total = total * input[i];
            }
          }
          break;
        case '/':
          {
            total = input[0];
            for (var i = 1; i < input.length; i++) {
              total = (total / input[i]).round();
            }
          }
          break;
        default:
          {
            total = 0;
          }
          break;
      }
      setState(() {
        total = total;
        error = false;
      });
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                  child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _input1Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Input 1',
                              ),
                            ),
                          ),
                          Checkbox(
                            value: value[0],
                            onChanged: (bool value) {
                              setState(() {
                                this.value[0] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _input2Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Input 2',
                              ),
                            ),
                          ),
                          Checkbox(
                            value: value[1],
                            onChanged: (bool value) {
                              setState(() {
                                this.value[1] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _input3Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Input 3',
                              ),
                            ),
                          ),
                          Checkbox(
                            value: value[2],
                            onChanged: (bool value) {
                              setState(() {
                                this.value[2] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              createCalculateSection(),
              if (!error)
                Text(
                  "Hasil = $total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              else
                Text(
                  "Check minimal 2 input",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createCalculateSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              _calculate('+');
            },
            child: const Text('+',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              _calculate('-');
            },
            child: const Text('-',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              _calculate('*');
            },
            child: const Text('x',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              _calculate('/');
            },
            child: const Text('/',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
