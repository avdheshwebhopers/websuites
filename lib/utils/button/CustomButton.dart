import 'package:flutter/material.dart';
import '../appColors/app_colors.dart';

class CustomButton extends StatefulWidget {
  final double borderRadius; // Parameter for border radius
  final Widget child; // Allows any widget as a child
  final VoidCallback onPressed; // Callback function for button press
  final double height; // Custom button height
  final double width; // Custom button width
  // final Color backgroundColor; // Optional parameter for button color
  final Color foregroundColor; // Optional parameter for content color
  final EdgeInsets padding; // Optional padding inside the button

  const CustomButton({
    Key? key,
    this.borderRadius = 8.0, // Default border radius
    required this.child, // Child widget
    required this.onPressed, // Button callback
    this.height = 50.0, // Default height
    this.width = 150.0, // Default width
    // this.backgroundColor = AllColors.mediumPurple, // Default background color
    this.foregroundColor = Colors.white, // Default content color
    this.padding = EdgeInsets.zero, // Default padding
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height, // Set button height
      width: widget.width, // Set button width
      child: ElevatedButton(
        onPressed: widget.onPressed, // Callback for button press
        style: ElevatedButton.styleFrom(
         backgroundColor: AllColors.mediumPurple,
          foregroundColor: widget.foregroundColor, // Button content color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius), // Custom border radius
          ),
          padding: widget.padding, // Custom padding
          visualDensity: VisualDensity.compact, // Reduce default spacing
        ),
        child: widget.child, // Use child widget directly
      ),
    );
  }
}
