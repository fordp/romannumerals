// import 'package:flutter/material.dart';

class ConvertDecimalToRoman {
  var decimalValue = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  var romanNumeral = [
    'M',
    'CM',
    'D',
    'CD',
    'C',
    'XC',
    'L',
    'XL',
    'X',
    'IX',
    'V',
    'IV',
    'I'
  ];

  String decimalToRoman(int dec) {
    var roman = '';

    for (var index = 0; index < decimalValue.length; index++) {
      while (decimalValue[index] <= dec) {
        roman += romanNumeral[index];
        dec -= decimalValue[index];
      }
    }

    return roman;
  }
}
