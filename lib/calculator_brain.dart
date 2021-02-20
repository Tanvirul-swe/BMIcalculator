import 'dart:math';
import 'input_page.dart';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  
  double bmi;

  String calculateBMI(){
    bmi = weight/ pow(height/100, 2);

   return bmi.toStringAsFixed(1);

  }

    String getResult(){
    if(bmi.toInt()>=25){
      return 'Overweight';
    }
    else if(bmi.toInt()>18.5){
      return 'Normal';
    }
    else{
      return'Underweight';
    }

    }

    String getInterpretation(){
      if(bmi.toInt()>=25){
        return 'You have a higher than normal body weight. Try to exercise more.';
      }
      else if(bmi.toInt()>18.5){
        return 'You have a normal body weight. Good job!';
      }
      else{
        return'You have a lower than normal body weight. You can eat a bit more.';
      }

    }
}