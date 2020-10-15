import 'package:flutter/material.dart';
import 'package:test2app/BMI/weight.dart';
import 'dart:math';
import 'bmi_result.dart';
import 'height.dart';

void BMICalculator() {
  bmi = (weightVal / pow(heightVal/100, 2)).roundToDouble();
}

void BMIState(){
  if (bmi < 15) {
    bmiState = 'Very severely Underweight';
    downBMI = 0;
    upBMI = 15;
  }else if(bmi >= 15 && bmi < 16){
    bmiState = 'Severely Underweight';
    downBMI = 15;
    upBMI = 16;
  }else if(bmi >= 16 && bmi < 18.5){
    bmiState = 'Underweight';
    downBMI = 16;
    upBMI = 18.5;
  }else if(bmi >= 18.5 && bmi < 25) {
    bmiState = 'Normal (healthy weight)';
    downBMI = 18.5;
    upBMI = 25;
  }else if(bmi >= 25 && bmi < 30) {
    bmiState = 'Overweight';
    downBMI = 25;
    upBMI = 30;
  }else if(bmi >= 30 && bmi < 35) {
    bmiState = 'Moderately Obese';
    downBMI = 30;
    upBMI = 35;
  }else if(bmi >= 35 && bmi < 40) {
    bmiState = 'Severely Obese';
    downBMI = 35;
    upBMI = 40;
  }else {
    bmiState = 'Very Severely Obese';
    downBMI = 40;
    upBMI = 200;
  }
}