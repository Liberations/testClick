import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: const TestClick(),
    );
  }
}

class TestClick extends StatefulWidget {
  const TestClick({Key? key}) : super(key: key);

  @override
  State<TestClick> createState() => _TestClickState();
}

class _TestClickState extends State<TestClick> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(title: const Text('title'),),
          Expanded(
            child: PageView(
              children: [
                _buildPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Scaffold _buildPage() {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            count++;
          });
        },
        child: Column(
          children: [
            ///top of Scaffold may block GestureDetector on Scaffold._handleStatusBarTap
            ///is there any way to disable Scaffold _handleStatusBarTap???
            ///platform: TargetPlatform.iOS is needed...
            Container(height: 30, color: Colors.red, child: Center(child: Text('can not click here $count'))),
            Container(height: 100, color: Colors.blue, child: Center(child: Text('can click here $count')))
          ],
        ),
      ),
    );
  }
}
