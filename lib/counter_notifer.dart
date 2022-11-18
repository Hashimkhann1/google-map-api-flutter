import 'package:flutter/material.dart';

class ContNotifer {

  ValueNotifier initialNumber = ValueNotifier(0);
  
  increase(){
    // print('increase $count');
    // initialNumber.value = count;
    initialNumber.value++;
  }
  decrease(){
    // print('from decrase $count');
    if(initialNumber.value > 0){
      initialNumber.value--;
    }
  }
}