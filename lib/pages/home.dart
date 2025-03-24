import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var variable;
    return Scaffold(

      appBar: customAppBar("IMC Calculator"),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 50),
            customTextField("Height (cm)"),
            customTextField("Weight (kg)"),
            SizedBox(height: 40),
            customElevatedButton(),
            SizedBox(height: 40),
            Text(
              "Your IMC is: $variable",
              style: TextStyle(
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

  AppBar customAppBar(String label){
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

  ElevatedButton customElevatedButton() {
    return ElevatedButton(
            onPressed: () {
              
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              shadowColor: const Color.fromARGB(127, 223, 223, 223),
              elevation: 30,
              surfaceTintColor: Colors.transparent, // Prevents color change with elevation
            ),
            child: Text(
              "Calculate",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
          );
  }

  Container customTextField(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 40, left: 40, right: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 223, 223),
            spreadRadius: 0.0,
            blurRadius: 40,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        keyboardType: TextInputType.number,
      )
    );
  }

  
}