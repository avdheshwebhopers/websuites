import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../utils/appColors/app_colors.dart';

import '../../../../../utils/button/CustomButton.dart';
import '../../../../../utils/fontfamily/FontFamily.dart';
import '../../../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';



class HrmPlanDiliouge extends StatefulWidget {
  @override
  _HrmPlanDiliougeState createState() => _HrmPlanDiliougeState();
}

class _HrmPlanDiliougeState extends State<HrmPlanDiliouge> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  // Function to show DatePicker in a dialog
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime(2100);

    // Show the date picker inside a dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Date'),
          content: SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDate,
              minimumDate: firstDate,
              maximumDate: lastDate,
              onDateTimeChanged: (DateTime newDateTime) {
                controller.text = "${newDateTime.toLocal()}".split(' ')[0]; // Format the date
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Update Leave Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AllColors.blackColor,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Leave Type Field
          Text('Leave Plan Name *'),
          SizedBox(height: 5),
          CreateNewLeadScreenCard(
            hintText: 'Ok',
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Start Date *'),
                    CreateNewLeadScreenCard(
                      isDateField: true,
                      hintText: 'Start Date',
                      controller: startDateController, // Assign controller here
                      onTap: () => _selectDate(context, startDateController),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Date *'),
                    CreateNewLeadScreenCard(
                      isDateField: true,
                      hintText: 'End Date',
                      controller: endDateController, // Assign controller here
                      onTap: () => _selectDate(context, endDateController),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Description *'),
          SizedBox(height: 5),
          CreateNewLeadScreenCard(
            hintText: 'Description',
          ),
          SizedBox(height: 8),
          Row(
            children: [
              CustomButton(
                height: Get.height / 28,
                width: 100,
                backgroundColor : AllColors.greyGoogleForm,
                child: Text(
                  'Choose files',
                  style: TextStyle(color: AllColors.blackColor, fontSize: 12),
                ),
           onPressed: (){},
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                   'No file selected',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                width: 80,
                height: 30,
                borderRadius: 25,
                onPressed: () {
                  // Handle update action
                  // You could add any save or update logic here
                },
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.sfPro,
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: AllColors.textField,
                width: 80,
                height: 30,
                borderRadius: 25,
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.sfPro,
                    color: AllColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
