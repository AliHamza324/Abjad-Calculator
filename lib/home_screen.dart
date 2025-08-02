import 'package:abjad_calculator/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ابجد کیلکولیٹر',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 4.0,
      ),
      backgroundColor: Color.fromARGB(255, 217, 248, 105),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                
                controller: ctrl.textController,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'جملہ یا آیت لکھیں',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                maxLines: 3,
                keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: const Text(
                    "حروف ابجد منتخب کریں",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      child: Text(
                        'ابجد قمری',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              buildResultBox('اعداد', ctrl.abjadValue.value),
              buildResultBox("مفرد اعداد", ctrl.mufarradAdad1.value),
              buildResultBox('مفرد عدد', ctrl.mufarradAdad2.value),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ctrl.calculateValues();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(225, 210, 231, 102),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                child: const Text(
                  'نقش پُر کریں',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildResultBox(String title, int value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(225, 210, 231, 102),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.black, width: 2.0),
    ),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8.0),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
