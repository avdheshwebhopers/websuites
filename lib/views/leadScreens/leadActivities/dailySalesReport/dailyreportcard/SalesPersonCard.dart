import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPersonController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}

class SalesPerson {
  final String name;
  final String email;
  final int answered;
  final int notAnswered;
  final int wrongNumber;
  final int numberBusy;
  final int physicalMeeting;
  final int virtualMeeting;
  final int total;
  final int totalMeeting;

  SalesPerson({
    required this.name,
    required this.email,
    required this.answered,
    required this.notAnswered,
    required this.wrongNumber,
    required this.numberBusy,
    required this.physicalMeeting,
    required this.virtualMeeting,
    required this.total,
    required this.totalMeeting,
  });
}

class SalesPersonCard extends StatelessWidget {
  final SalesPerson salesPerson;
  final SalesPersonController controller = Get.put(SalesPersonController());

  SalesPersonCard({Key? key, required this.salesPerson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = TextStyle(color: Colors.grey);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  salesPerson.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/icons/edit.png',
                    height: 16,
                    color: Color(0xFF6E6A7C),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 14,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  salesPerson.email,
                  style: subtitleStyle,
                ),
                Spacer(),
                Obx(
                      () => IconButton(
                    icon: Icon(
                      controller.isExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 18,
                      color: Colors.black,
                    ),
                    onPressed: controller.toggleExpanded,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(
                  Icons.phone_in_talk_outlined,
                  color: Colors.green,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  "Total: ${salesPerson.total}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.group_sharp,
                    color: Colors.blue,
                    size: 19,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Total: ${salesPerson.totalMeeting}",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Obx(
                  () {
                if (!controller.isExpanded.value) return SizedBox.shrink();

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Answered: ${salesPerson.answered}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Not Answered: ${salesPerson.notAnswered}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Wrong Number: ${salesPerson.wrongNumber}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Number Busy: ${salesPerson.numberBusy}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, right: 15.0),
                                child: Text(
                                  "Physical Meeting: ${salesPerson.physicalMeeting}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, right: 15.0),
                                child: Text(
                                  "Virtual Meeting: ${salesPerson.virtualMeeting}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}