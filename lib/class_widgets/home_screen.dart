import 'package:bmi_calculation_flutter/class_widgets/left_shape.dart';
import 'package:bmi_calculation_flutter/class_widgets/right_shape.dart';
import 'package:bmi_calculation_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0.0;
  String resultText = '';
  double widthGood = 100.0;
  double widthBad = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _getAppbar(),
      backgroundColor: Colors.white,
      body: _getMainBody(),
    );
  }

  Widget _getMainBody() {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _setTextField('وزن', weightController),
              _setTextField('قد', heightController),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              final weight = double.parse(weightController.text);
              final height = double.parse(heightController.text);
              setState(() {
                resultBMI = weight / (height * height);
                if (resultBMI > 25) {
                  widthBad = 300;
                  widthGood = 40;
                  resultText = '.شما اضافه وزن دارید';
                } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                  widthGood = 300;
                  widthBad = 40;
                  resultText = '.وزن شما نرمال می باشد';
                } else {
                  widthBad = 10;
                  widthGood = 10;
                  resultText = '.وزن شما کمتر از وزن نرمال می باشد';
                }
              });
            },
            child: Text(
              'محاسبه کن',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${resultBMI.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '$resultText',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          RightShape(
            width: widthBad,
          ),
          SizedBox(
            height: 8,
          ),
          LeftShape(
            width: widthGood,
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _getAppbar() {
    return AppBar(
      title: Text(
        'محاسبه BMI',
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _setTextField(
      String hintString, TextEditingController textEditingController) {
    return Container(
      width: 60,
      child: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: redBackground,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: '$hintString',
            hintStyle: TextStyle(
              color: Colors.red.withOpacity(0.5),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
