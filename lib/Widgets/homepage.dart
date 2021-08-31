import 'package:callapp/Widgets/numberpad.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];

  String display = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 300,
            width: 400,
            child: FutureDemoPage(),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              display,
              style: TextStyle(
                  fontSize: 25,
                  debugLabel: "Enter the Number",
                  fontWeight: FontWeight.w300),
            ),
          )),
          Center(
            child: Container(
              height: 310,
              width: 250,
              child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 10 / 8,
                      mainAxisSpacing: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                display = display + numbers[index];
                              });
                            },
                            child: Center(child: Text(numbers[index]))));
                  }),
            ),
          ),
          Container(
            width: 220,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        setState(() {
                          FlutterPhoneDirectCaller.callNumber(display);
                          Text(display);
                          print(display);
                        });
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: IconButton(
                      icon: Icon(Icons.backspace),
                      onPressed: () {
                        if (display.length != 0) {
                          setState(() {
                            display = display.substring(0, display.length - 1);
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
