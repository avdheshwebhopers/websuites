import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final String title; // Add title property
  final String? subtitle; // Optional subtitle property

  const CustomAppBar({Key? key, required this.child, required this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Optionally, you can add a back button here
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back
                },
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (subtitle != null) // Display subtitle if provided
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                subtitle!,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          child, // Any additional widgets can be placed here
        ],
      ),
    );
  }
}