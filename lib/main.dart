import 'package:flutter/material.dart';
import 'package:bmicalculator/calc.dart';

void main() => runApp(MaterialApp(
  home: Calc(),
  theme: ThemeData(
    primarySwatch: Colors.red,
  ),
  debugShowCheckedModeBanner: false,
));
