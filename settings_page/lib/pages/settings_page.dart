import 'package:flutter/material.dart';
import 'package:settings_page/main.dart';
import './../data/shared_prefs.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double fontSize = 16;
  List<int> colors = [0xFF455A64, 0xFFFFC107, 0xFF673AB7, 0xFF795548];

  int selectedColor;

  SharedPrefs sharedPrefs;
  @override
  void initState() {
    sharedPrefs = SharedPrefs();
    sharedPrefs.init();
    selectedColor = sharedPrefs.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(selectedColor),
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
                    fontSize: fontSize,
                  ),
                ),
                Slider(
                  activeColor: Color(selectedColor),
                  label: fontSize.round().toString(),
                  min: 12,
                  max: 44,
                  divisions: 5,
                  value: fontSize,
                  onChanged: (double newValue) {
                    setState(() {
                      fontSize = newValue;
                    });
                  },
                ),
                Text(
                  'Set the App main color',
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        setColor(0),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        ),
                      },
                      child: ColorCircle(colors[0]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(1),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        ),
                      },
                      child: ColorCircle(colors[1]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(2),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        ),
                      },
                      child: ColorCircle(colors[2]),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setColor(3),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        )
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

  void setColor(int colorIndex) {
    setState(() {
      selectedColor = colors[colorIndex];
      sharedPrefs.setColor(colors[colorIndex]);
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
