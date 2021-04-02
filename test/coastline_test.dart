import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Text("bbbb"),
    );
  }
}
