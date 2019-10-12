import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'dart:math' show Random;

// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13"
  ];

  int top = 1;
  List<Widget> rowItems = [];

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(3.125),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int i, List<Widget> rowItems) {
    return Container(
      height: 120.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: rowItems,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDummyRow(int i) {
    return Container(
      height: 120.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SpringButton(
                    SpringButtonType.OnlyScale,
                    row(
                      "dummy " + i.toString(),
                      Colors.cyan,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String url) {
    return Expanded(
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          url,
          Colors.cyan,
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildSearches() {
    return new ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (context, i) {

          rowItems.add(_rowItem(items[i]));
          List<Widget> aux;
          if (i < top) {
            print("-"+i.toString());
            // return _buildDummyRow(i);
            aux = rowItems;
          } else {
            print(top);
            Random rnd = new Random();

            int min = 2, max = 4;
            int n = min + rnd.nextInt(max - min);

            top = i + n;

            rowItems.clear();
            rowItems = [];
            aux = rowItems;
          }
          return _buildRow(i, aux);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: _buildSearches(),
      // gridConstructor(),
      //     ListView(
      //   scrollDirection: Axis.vertical,
      //   physics: AlwaysScrollableScrollPhysics(),
      //   children: [
      //     Container(
      //       height: 120.0,
      //       child: Row(
      //         children: <Widget>[
      //           Expanded(
      //             flex: 1,
      //             child: SpringButton(
      //               SpringButtonType.OnlyScale,
      //               row(
      //                 "Row0",
      //                 Colors.cyan,
      //               ),
      //               onTap: () {},
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       height: 120.0,
      //       child: Row(
      //         children: <Widget>[
      //           Expanded(
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: SpringButton(
      //                     SpringButtonType.OnlyScale,
      //                     row(
      //                       "Row11",
      //                       Colors.cyan,
      //                     ),
      //                     onTap: () {},
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: SpringButton(
      //                     SpringButtonType.OnlyScale,
      //                     row(
      //                       "Row12",
      //                       Colors.deepPurpleAccent,
      //                     ),
      //                     onTap: () {},
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: SpringButton(
      //             SpringButtonType.OnlyScale,
      //             row(
      //               "Row2",
      //               Colors.redAccent,
      //             ),
      //             useCache: false,
      //             onTap: () {},
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: SpringButton(
      //                   SpringButtonType.OnlyScale,
      //                   row(
      //                     "Row31",
      //                     Colors.deepOrangeAccent,
      //                   ),
      //                   useCache: false,
      //                   onTap: () {
      //                     // setState(() {
      //                     //   imageSequenceAnimator.animationController.isAnimating
      //                     //       ? imageSequenceAnimator.pause()
      //                     //       : imageSequenceAnimator.play();
      //                     // });
      //                   },
      //                 ),
      //               ),
      //               Expanded(
      //                 child: SpringButton(
      //                   SpringButtonType.OnlyScale,
      //                   row(
      //                     "Row32",
      //                     Colors.green,
      //                   ),
      //                   useCache: false,
      //                   onTap: () {
      //                     // imageSequenceAnimator.stop();
      //                   },
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: SpringButton(
      //                   SpringButtonType.OnlyScale,
      //                   row(
      //                     "Row41",
      //                     Colors.teal,
      //                   ),
      //                   useCache: false,
      //                   onTap: () {
      //                     // imageSequenceAnimator.restart();
      //                   },
      //                 ),
      //               ),
      //               Expanded(
      //                 child: SpringButton(
      //                   SpringButtonType.OnlyScale,
      //                   row(
      //                     "Row42",
      //                     Colors.indigoAccent,
      //                   ),
      //                   useCache: false,
      //                   onTap: () {
      //                     // imageSequenceAnimator.rewind();
      //                   },
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
