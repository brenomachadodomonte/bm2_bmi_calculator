import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  final heightController = TextEditingController();
  final weightController  = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('BM2'),
              Text('Body Mass Index', style: TextStyle(fontSize: 22)),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (text){
                        if(text.isEmpty){
                          return "Height is required!";
                        } else if(int.parse(text) == 0){
                          return "Invalid Height!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Your Height(cm)',
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(color: Colors.grey[700], fontSize: 25.0),
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      //onChanged: onChanged,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      validator: (text){
                        if(text.isEmpty){
                          return "Weight is required!";
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
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
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton.extended(
                    label: Text('Reset'),
                    icon: Icon(Icons.clear),
                    onPressed: _reset,
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
      ),
    );
  }

  void _reset(){
    heightController.text = '';
    weightController.text = '';
    setState(() {
      _bmi = '';
      _result = '';
    });
  }

  void _calc(){
    if(_formKey.currentState.validate()){
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
}
