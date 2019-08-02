import 'package:flutter/material.dart';
import 'package:stratis_flutter/stratis_flutter.dart';

import 'package:flutter/foundation.dart'
  show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stratis Flutter GUI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pool Create Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController;
  TextEditingController _blockdevController;

  void _createPool() {
    StratisFlutter.createPool(
      name: "mypool",
      blockdevs: ["/dev/example1", "/dev/example2"]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
            ),
   /*         TextField(
              controller: _blockdevController,
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPool,
        tooltip: 'Create Pool',
        child: Icon(Icons.add),
      ),
    );
  }
}
