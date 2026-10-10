import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController controller;
  VoidCallback function;

  SearchWidget({super.key, required this.controller, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Ingresa la ciudad",
          hintStyle: TextStyle(color: Colors.grey.shade700),
          filled: true,
          suffixIcon: IconButton(
            onPressed: function,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          fillColor: Colors.black.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "El campo es obligatorio";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
