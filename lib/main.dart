import 'package:flutter/cupertino.dart';
import 'package:stratis_flutter/stratis_flutter.dart';

import 'package:flutter/foundation.dart'
  show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
   runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Stratis Flutter GUI Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: _MyHomePage(title: 'Pool Create Demo'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  TextEditingController _nameController;
  TextEditingController _blockdevController;
  String version = "Tap the button";

  void _createPool() {
    StratisFlutter.createPool(name: "mypool", blockdevs: ["/dev/example1", "/dev/example2"]).then(
      (result) => setState(() {
        print(result);
      })
    );
  }

  void _getVersion() {
    StratisFlutter.getVersion().then(
      (result) => setState(() {
        print(result);
      })
    );
  }

  void _destroyPool() {
    StratisFlutter.destroyPool( "mypool").then(
      (result) => setState(() {
        print(result);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold  (
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: _createPool,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.add_circled_solid),
                  Text("Create Pool")
                ]
              )
            ),
            CupertinoButton(
              onPressed: _getVersion,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.time),
                  Text("Get Version")
                ]
              )
            ),
            CupertinoButton(
              onPressed: _destroyPool,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.delete),
                  Text("Destroy Pool")
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
