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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var result = '';
  var status = '';
  String imagePath = '';

  var bgColor = Colors.purple.shade800;

  @override
  void dispose() {
    wtController.dispose();
    ftController.dispose();
    super.dispose();
  }

  void calculateBMI() {
    var wt = wtController.text.trim();
    var ft = ftController.text.trim();

    if (wt.isEmpty || ft.isEmpty) {
      setState(() {
        result = 'Please fill all the required fields';
      });
      return;
    }
    double? iwt = double.tryParse(wt);
    double? ift = double.tryParse(ft);

    if (iwt == null || ift == null) {
      setState(() {
        result = 'Please enter valid numbers only';
      });
      return;
    }

    double totalInch = ift * 12;
    double totalCm = totalInch * 2.54;
    double totalM = totalCm / 100;

    double bmi = iwt / (totalM * totalM);

    if (bmi > 25) {
      setState(() {
        status = 'You are Overweight';
      });
    } else if (bmi < 18) {
      setState(() {
        status = 'You are Underweight';
      });
    } else {
      setState(() {
        status = 'You are Healthy';
      });
    }
    if (bmi > 25) {
      setState(() {
        bgColor = Colors.red.shade900;
        imagePath = 'assets/images/overweight.png';
      });
    } else if (bmi < 18) {
      setState(() {
        bgColor = Colors.orange.shade900;
        imagePath = 'assets/images/underweight.png';
      });
    } else {
      setState(() {
        bgColor = Colors.green.shade900;
        imagePath = 'assets/images/healthy.png';
      });
    }

    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}\n$status';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen")),

      body: Container(
        color: bgColor,

        child: Center(
          child: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        label: Text('Enter Your Weight(in kg)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),

                    SizedBox(height: 21),

                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        label: Text('Enter Your Height(in Feet)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),

                    SizedBox(height: 21),

                    ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 21),
                    if (imagePath.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset(imagePath, height: 150),
                      ),
                    Text(result, style: TextStyle(fontSize: 19)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
