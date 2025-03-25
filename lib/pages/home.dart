import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String imcResult = "--.--";

  void calculateIMC() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        imcResult = "Invalid input";
      });
      return;
    }

    // Converter altura de cm para metros
    height = height / 100;
    double imc = weight / (height * height);

    setState(() {
      imcResult = imc.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("IMC Calculator"),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            customTextField("Height (cm)", heightController),
            customTextField("Weight (kg)", weightController),
            const SizedBox(height: 40),
            customElevatedButton(),
            const SizedBox(height: 40),
            Text(
              "Your IMC is: $imcResult",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar customAppBar(String label) {
    return AppBar(
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 10,
      shadowColor: const Color.fromARGB(40, 0, 0, 0),
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget customElevatedButton() {
    return ElevatedButton(
      onPressed: calculateIMC,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        shadowColor: WidgetStateProperty.all(
          const Color.fromARGB(127, 223, 223, 223),
        ),
        elevation: WidgetStateProperty.all(30),
        overlayColor: WidgetStateProperty.all(
          Colors.grey[300],
        ), // Cor ao pressionar
      ),
      child: const Text(
        "Calculate",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }

  Widget customTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 40, left: 40, right: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            spreadRadius: 0.0,
            blurRadius: 40,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black, fontSize: 18),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
