import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(myapp());

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController _hcon = TextEditingController();
  TextEditingController _wcon = TextEditingController();
  double _bmires = 0;
  String _textres = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text(
          'BMI calculator',
          style: TextStyle(fontSize: 18.0, color: Colors.teal),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextField(
                    controller: _hcon,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: 'height',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        )),
                  ),
                  width: 130.0,
                  height: 90.0,
                  color: Colors.black87,
                ),
                Container(
                  child: TextField(
                    controller: _wcon,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: 'weight',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        )),
                  ),
                  width: 130.0,
                  height: 90.0,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
              onPressed: () {
                double heg = double.parse(_hcon.text);
                double weg = double.parse(_wcon.text);
                setState(() {
                  _bmires = weg / (heg * heg);

                  if (_bmires > 25) {
                    _textres = "you are over weight";
                  } else if (_bmires >= 18.5 && _bmires <= 25) {
                    _textres = "its ok";
                  } else {
                    _textres = "you are under weight ";
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black87,
              ),
              child: const Text(
                'calculate',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 40.0,
                ),
              )),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            _bmires.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Visibility(
            visible: _textres.isNotEmpty,
            child: Text(
              _textres,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          const rbar(wbar: 30.0),
          const rbar(wbar: 60.0),
          const rbar(wbar: 30.0),
          SizedBox(
            height: 20.0,
          ),
          const lbar(wbarl: 30.0),
          SizedBox(
            height: 50.0,
          ),
          const lbar(wbarl: 30.0),
        ],
      ),
    );
  }
}

class rbar extends StatelessWidget {
  final double wbar;
  const rbar({Key? key, required this.wbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 20.0,
            width: wbar,
            decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                )),
          ),
        ],
      ),
    );
  }
}

class lbar extends StatelessWidget {
  final double wbarl;
  const lbar({Key? key, required this.wbarl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20.0,
          width: wbarl,
          decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
        )
      ],
    );
  }
}
