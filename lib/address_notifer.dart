

import 'package:flutter/cupertino.dart';

class AddressConversion {

  ValueNotifier setAddress = ValueNotifier('');


  setUpdatedAddress(String newValue) {
    setAddress.value = newValue;
    // print('from AddressConversion : ${setAddress.value}');
  }

}