import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textController = TextEditingController();
  RxInt abjadValue = 0.obs;
  RxInt mufarradAdad1 = 0.obs;
  RxInt mufarradAdad2 = 0.obs;

  final Map<String, int> abjadQamri = {
    'ّ': 0,
    'ا': 1, 'أ': 1, 'إ': 1, 'آ': 1, // Alef variants
    'ب': 2, 'پ': 2, // Ba and Pa
    'ج': 3, 'چ': 3, // Jeem and Cheem
    'د': 4,
    'ه': 5, 'ة': 5, 'ھ': 5, 'ہ': 5,
    'و': 6, 'ؤ': 6, // Waw and Waw with Hamza
    'ز': 7, 'ژ': 7, // Za and Zha
    'ح': 8,
    'ط': 9,
    'ی': 10, 'یٰ': 10, 'ئ': 10, 'ے': 10, // Ya and its variants
    'ك': 20, 'ک': 20, 'گ': 20, // Kaf, Keh and Gaf
    'ل': 30,
    'م': 40,
    'ن': 50,
    'س': 60,
    'ع': 70,
    'ف': 80,
    'ص': 90,
    'ق': 100,
    'ر': 200,
    'ش': 300,
    'ت': 400,
    'ث': 500,
    'خ': 600,
    'ذ': 700,
    'ض': 800,
    'ظ': 900,
    'غ': 1000,
  };

  void calculateValues() {
    if (textController.text.isNotEmpty) {
      int total = 0;

      for (var char in textController.text.split('')) {
        total += abjadQamri[char] ?? 0;
      }
      abjadValue.value = total;
      calculateMufrad1();
      calculateSecondMufrad();
    } else if (textController.text.isEmpty) {
      Get.snackbar('ابجد کیلکولیٹر', "براہِ مہربانی نقش پُر کریں");
      abjadValue.value = 0;
      mufarradAdad1.value = 0;
      mufarradAdad2.value = 0;
    }
  }

  void calculateMufrad1() {
    mufarradAdad1.value = abjadValue
        .toString()
        .split("")
        .map(int.parse)
        .reduce((a, b) => a + b);
  }

  int calculateSecondMufrad() {
    int value = mufarradAdad1.value;
    while (value > 9) {
      value = value.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }
    mufarradAdad2.value = value;
    return value;
  }
}
