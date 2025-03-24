import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IMC Calculator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          customTextField("Height (cm)"),
          SizedBox(height: 20),
          customTextField("Weight (kg)"),
        ],
      ),
    );
  }

  Container customTextField(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            
            color: const Color.fromARGB(255, 235, 235, 235),
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
            color: Colors.black,
            fontSize: 18,
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