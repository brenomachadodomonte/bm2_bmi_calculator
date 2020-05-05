import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  final heightController = TextEditingController();
  final weightController  = TextEditingController();
  String _bmi  = '';
  String _result  = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('BM2'),
            Text('Body Mass Index', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Height(cm)',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.grey[700], fontSize: 25.0),
              controller: heightController,
              keyboardType: TextInputType.number,
              //onChanged: onChanged,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Weight(kg)',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.grey[700], fontSize: 25.0),
              controller: weightController,
              keyboardType: TextInputType.number,
              //onChanged: onChanged,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton.extended(
                  label: Text('Reset'),
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    //TODO: Clear fields and Result
                  },
                ),
                FloatingActionButton.extended(
                  label: Text('Calc'),
                  icon: Icon(Icons.check),
                  onPressed: _calc,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),
            Text(_bmi, style: TextStyle(fontSize: 18)),
            Text(_result, style: TextStyle(fontSize: 26)),
          ],
        ),
      ),
    );
  }

  void _calc(){
    int height = int.parse(heightController.text);
    int weight = int.parse(weightController.text);

    double bmi = weight / ((height / 100) * (height / 100));
    String shape = '';

    if(bmi < 18.5){
      shape = 'underweight';
    } else if(bmi < 25){
      shape = 'normal weight';
    } else if(bmi < 30){
      shape = 'overweight';
    } else {
      shape = 'obesity';
    }

    setState(() {
      _bmi = 'Your BMI is ${bmi.toStringAsFixed(2)}';
      _result = 'You are $shape';
    });
  }
}
