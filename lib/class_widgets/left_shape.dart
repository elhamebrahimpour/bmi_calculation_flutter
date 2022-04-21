import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  const LeftShape({Key? key, this.width = 0}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(2),
              bottomRight: Radius.circular(18),
            ),
            color: Colors.green,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'شاخص مثبت',
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
