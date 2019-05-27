import 'package:flutter/material.dart';


class RomanToNumber {
  int value(String r) {
    if (r == 'I') 
      return 1; 
    if (r == 'V') 
      return 5; 
    if (r == 'X') 
      return 10; 
    if (r == 'L') 
      return 50; 
    if (r == 'C') 
      return 100; 
    if (r == 'D') 
      return 500; 
    if (r == 'M') 
      return 1000; 
    
    return -1;
  }

  int romanToDecimal(String str) {
    int res = 0;

    for (int i = 0; i < str.length; i++) {

    }

    return res;
  }
}