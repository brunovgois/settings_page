import 'package:flutter/material.dart';
import 'package:settings_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _fontSize;
  List<int> colors = [0xFF455A64, 0xFFFFC107, 0xFF673AB7, 0xFF795548];

  int _selectedColor;

  @override
  void initState() {
    super.initState();
    _loadConfigs();
  }

  void _loadConfigs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedColor = (prefs.getInt('color') ?? 0xFFFFC107);
      _fontSize = (prefs.getDouble('fontSize') ?? 16);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
              (Route<dynamic> route) => false),
        ),
        backgroundColor: Color(_selectedColor),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Set the App font size',
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
                Slider(
                  activeColor: Color(_selectedColor),
                  label: _fontSize.round().toString(),
                  min: 12,
                  max: 44,
                  divisions: 5,
                  value: _fontSize,
                  onChanged: (double newValue) {
                    setState(() {
                      setFontSize(newValue);
                    });
                  },
                ),
                Text(
                  'Set the App main color',
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        setColor(0),
                      },
                      child: ColorCircle(colors[0]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(1),
                      },
                      child: ColorCircle(colors[1]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(2),
                      },
                      child: ColorCircle(colors[2]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(3),
                      },
                      child: ColorCircle(colors[3]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setColor(int colorIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedColor = colors[colorIndex];
      prefs.setInt('color', colors[colorIndex]);
    });
  }

  void setFontSize(double fontSize) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = fontSize;
      prefs.setDouble('fontSize', fontSize);
    });
  }
}

class ColorCircle extends StatelessWidget {
  final int color;
  ColorCircle(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Color(color),
      ),
    );
  }
}
