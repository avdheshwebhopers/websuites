// import 'package:flutter/material.dart';
//
// class DatePickerDialogWidget extends StatelessWidget {
//   final DateTime? initialDate;
//   final Function(DateTime) onDateSelected;
//
//   const DatePickerDialogWidget({
//     Key? key,
//     this.initialDate,
//     required this.onDateSelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white, // Set background color to white
//       title: Text('Select Date'),
//       content: SizedBox(
//         height: 300, // Set a fixed height for the dialog content
//         child: CalendarDatePicker(
//           initialDate: initialDate ?? DateTime.now(),
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2101),
//           onDateChanged: (DateTime date) {
//             onDateSelected(date);
//             Navigator.of(context).pop(); // Close the dialog
//           },
//         ),
//       ),
//     );
//   }
// }