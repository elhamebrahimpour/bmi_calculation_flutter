import 'package:flutter/material.dart';

class TouchScreen extends StatefulWidget {
  TouchScreen({Key? key}) : super(key: key);

  @override
  State<TouchScreen> createState() => _TouchScreenState();
}

class _TouchScreenState extends State<TouchScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$counter',
                  style: TextStyle(fontSize: 28),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    counter = counter + 1;
                  }),
                  child: Text('کلیک'),
                ),
                InkWell(
                  onTap: () => setState(() {
                    counter = counter + 1;
                  }),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text('کلیک'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}