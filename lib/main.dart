import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoApp",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
      ),

      themeMode: ThemeMode.system,
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var _width = 200.0;
  var _height = 100.0;
  var _duration = Duration(seconds: 1);
  bool _isAnimate = true;
  Decoration _myDecor = BoxDecoration(
    color: Colors.purple,
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              curve: Curves.easeInOut,
              decoration: _myDecor,
              duration: _duration,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isAnimate) {
                    _width = 100.0;
                    _height = 200;
                    _duration = Duration(milliseconds: 800);
                    _myDecor = BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    );
                    _isAnimate = false;
                  } else {
                    _width = 200.0;
                    _height = 100.0;
                    _duration = Duration(milliseconds: 900);
                    _myDecor = BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(100),
                    );
                    _isAnimate = true;
                  }
                });
              },
              child: Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
