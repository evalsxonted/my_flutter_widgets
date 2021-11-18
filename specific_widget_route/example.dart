import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'launch_from_widget_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey globalKey2 = GlobalKey();
  GlobalKey globalKey3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
          child: InkWell(
            onTap: navigateTo3,
            child: Container(
              key: globalKey3,
              child: Text("hi from page 1"),
            ),
          ),
        ),
        floatingActionButton: IconButton(
          key: globalKey2,
          icon: Icon(Icons.add),
          onPressed: navigateTo2,
        ));
  }
  navigateTo2() async {
    LaunchFromWidgetRoute launchFromWidgetRoute = LaunchFromWidgetRoute(
      page: Page2(),
      widgetKey: globalKey2,
    );
    Navigator.push(context, launchFromWidgetRoute());
  }
  navigateTo3() async {
    LaunchFromWidgetRoute launchFromWidgetRoute = LaunchFromWidgetRoute(
      page: Page3(),
      widgetKey: globalKey3,
    );
    Navigator.push(context, launchFromWidgetRoute());
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          child: Text("hi from page 2"),
        ),
      ),
    );
  }
}


class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          child: Text("hi from page 3"),
        ),
      ),
    );
  }
}


