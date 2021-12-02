import 'dart:math';

import 'package:flutter/material.dart';

class CreditCardModel extends ChangeNotifier {
  // Control which background image is used for the card
  Image background = Image.asset(
      'assets/images/${(Random().nextInt(24) + 1).toString()}.jpeg');
  Image logo = Image.asset('assets/images/visa.png');

  // Text that should appear on the card image
  String number = "#### #### #### ####";
  String mask = "#### #### #### ####";
  String name = "FULL NAME";
  String cvv = "XXX";
  String cvvMask = "XXX";
  String? month;
  String? year;

  void randomizeBackground() {
    background = Image.asset(
        'assets/images/${(Random().nextInt(24) + 1).toString()}.jpeg');
    notifyListeners();
  }

  void _setCardBrand() {
    if (number.startsWith('4')) {
      logo = Image.asset('assets/images/visa.png');
      mask = "#### #### #### ####";
      cvvMask = "XXX";
    } else if (number.startsWith('5')) {
      logo = Image.asset('assets/images/mastercard.png');
      mask = "#### #### #### ####";
      cvvMask = "XXX";
    } else if (number.startsWith('34') || number.startsWith('37')) {
      logo = Image.asset('assets/images/amex.png');
      mask = "#### ###### #####";
      cvvMask = "XXXX";
    } else if (number.startsWith('6')) {
      logo = Image.asset('assets/images/discover.png');
      mask = "#### #### #### ####";
      cvvMask = "XXX";
    } else if (number.startsWith('30') ||
        number.startsWith('36') ||
        number.startsWith('38')) {
      logo = Image.asset('assets/images/dinersclub.png');
      mask = "#### ###### ####";
      cvvMask = "XXX";
    } else {
      logo = Image.asset('assets/images/visa.png');
      mask = "#### #### #### ####";
      cvvMask = "XXX";
    }

    if (cvv.startsWith('X') || cvv.length > cvvMask.length) {
      cvv = cvvMask;
    }
  }

  void setNumber(String newVal) {
    number = newVal + mask.substring(newVal.length);
    _setCardBrand();
    notifyListeners();
  }

  void setName(String newVal) {
    if (newVal.isEmpty) {
      name = "FULL NAME";
    } else {
      name = newVal;
    }

    notifyListeners();
  }

  void setCvv(String newVal) {
    cvv = newVal + cvvMask.substring(newVal.length);
    notifyListeners();
  }

  void setMonth(String? newVal) {
    month = newVal ?? "MM";
    notifyListeners();
  }

  void setYear(String? newVal) {
    year = newVal ?? "YY";
    notifyListeners();
  }
}
