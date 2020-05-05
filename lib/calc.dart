import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  final heightController = TextEditingController();
  final weightController  = TextEditingController();

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
                labelText: 'Your Height',
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
                labelText: 'Your Weight',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.grey[700], fontSize: 25.0),
              controller: weightController,
              keyboardType: TextInputType.number,
              //onChanged: onChanged,
            ),
            Padding(padding: EdgeInsets.all(10)),
            FloatingActionButton.extended(
              label: Text('Calc'),
              icon: Icon(Icons.check),
              onPressed: (){

              },
            )
          ],
        ),
      ),
    );
  }
}
