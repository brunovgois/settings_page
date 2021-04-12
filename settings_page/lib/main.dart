import 'package:flutter/material.dart';
import 'package:settings_page/data/shared_prefs.dart';
import 'pages/settings_page.dart';

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
  SharedPrefs sharedPrefs;
  int themeColor = 0xFFF00000;

  @override
  void initState() {
    sharedPrefs = SharedPrefs();
    sharedPrefs.init();
    themeColor = sharedPrefs.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App Title'),
        backgroundColor: Color(themeColor),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Settings Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have the app font to be: ',
            ),
          ],
        ),
      ),
    );
  }
}
