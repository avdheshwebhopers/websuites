
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../data/models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';
import '../../../../../utils/appColors/app_colors.dart';

class ServicesController extends GetxController {
  final TextEditingController startDateController = TextEditingController(),
      endDateController = TextEditingController(),
      nameController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      previousServiceController = TextEditingController(),
      additionalInfoController = TextEditingController();

  final isRenewing = false.obs,
      selectedDate = DateTime.now().obs,
      showYearPicker = false.obs,
      isSelectingStartDate = true.obs;

  final monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'];

  String getMonthName(int month) => monthNames[month - 1];
  int getDaysInMonth(DateTime date) => DateTime(date.year, date.month + 1, 0).day;
  bool isToday(DateTime date) => date.isAtSameMomentAs(DateTime.now());

  void updateDate(int day) {
    final newDate = DateTime(selectedDate.value.year, selectedDate.value.month, day);
    selectedDate.value = newDate;
    final formattedDate = '${day.toString().padLeft(2, '0')}/${selectedDate.value.month.toString().padLeft(2, '0')}/${selectedDate.value.year}';
    (isSelectingStartDate.value ? startDateController : endDateController).text = formattedDate;
    showYearPicker.value = false;
  }

  void changeMonth(int change) => selectedDate.value = DateTime(
    selectedDate.value.year,
    selectedDate.value.month + change,
    selectedDate.value.day,
  );

  void clearDate() => (isSelectingStartDate.value ? startDateController : endDateController).clear();
  void setToday() => updateDate(DateTime.now().day);
  void toggleYearPicker() => showYearPicker.toggle();

  void addService() {
    // Log service details
    print('Service Details - Name: ${nameController.text}, Email: ${emailController.text}, Phone: ${phoneController.text}, '
        'Start: ${startDateController.text}, End: ${endDateController.text}, Renewing: ${isRenewing.value}');
    Get.back();
  }

  @override
  void onClose() {
    [startDateController, endDateController, nameController, emailController,
      phoneController, previousServiceController, additionalInfoController]
        .forEach((controller) => controller.dispose());
    super.onClose();
  }
}

class ServicesDialog extends GetView<ServicesController> {
  const ServicesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      width: Get.width * 0.9,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildDateField("Start Date", controller.startDateController, true),
            const SizedBox(height: 10),
            _buildDateField("End Date", controller.endDateController, false),
            _buildAdditionalInfo(),
            _buildCalendar(),
            _buildRenewingSection(),
            _buildAddServiceButton(),
          ],
        ),
      ),
    ),
  );

  Widget _buildHeader() =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Start Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Adds ellipsis if the text is too long
              maxLines: 1, // Ensures the text fits within a single line
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.close,
              color: AllColors.mediumPurple,
              size: 20,
            ),
            onPressed: () => Get.back(),
          ),
        ],
      );


  Widget _buildDateField(String label, TextEditingController dateController, bool isStart) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 8),
      TextField(
        controller: dateController,
        readOnly: true,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: 'dd/mm/yyyy',
          hintStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          constraints: const BoxConstraints(maxHeight: 40),
          suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[400], size: 17),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        ),
        onTap: () {
          controller.isSelectingStartDate.value = isStart;
          controller.toggleYearPicker();
        },
      ),
    ],
  );

  Widget _buildAdditionalInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Additional Information"),
      const SizedBox(height: 10),
      Stack(
        children: [
          TextField(
            controller: controller.additionalInfoController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Additional Information',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Icon(Icons.send, color: Colors.grey[400], size: 14),
          ),
        ],
      ),
    ],
  );

  Widget _buildCalendar() => Obx(() => controller.showYearPicker.value
      ? SizedBox(
    height: 400,
    child: Column(
      children: [
        _buildCalendarHeader(),
        _buildWeekDays(),
        _buildCalendarGrid(),
        _buildCalendarButtons(),
      ],
    ),
  )
      : const SizedBox.shrink());

  Widget _buildCalendarHeader() => Obx(() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 14),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          visualDensity: VisualDensity.compact,
          onPressed: () => controller.changeMonth(-1),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => _showYearPicker(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    '${controller.getMonthName(controller.selectedDate.value.month)} ${controller.selectedDate.value.year}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 20),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 24,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 14),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
            onPressed: () => controller.changeMonth(1),
          ),
        ),
      ],
    ),
  ));

  void _showYearPicker() => Get.dialog(
    AlertDialog(
      content: SizedBox(
        width: 300,
        height: 300,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (_, index) {
            final year = DateTime.now().year + index;
            return ListTile(
              title: Text(year.toString()),
              onTap: () {
                controller.selectedDate.value = DateTime(
                  year,
                  controller.selectedDate.value.month,
                  controller.selectedDate.value.day,
                );
                Get.back();
              },
            );
          },
        ),
      ),
    ),
  );

  Widget _buildWeekDays() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map((day) => Text(day, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)))
          .toList(),
    ),
  );

  Widget _buildCalendarGrid() => Obx(() => Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemCount: controller.getDaysInMonth(controller.selectedDate.value),
      itemBuilder: (_, index) {
        final day = index + 1;
        final currentDate = DateTime(
          controller.selectedDate.value.year,
          controller.selectedDate.value.month,
          day,
        );
        final isSelected = day == controller.selectedDate.value.day;
        final isToday = controller.isToday(currentDate);

        return InkWell(
          onTap: () => controller.updateDate(day),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ?AllColors.mediumPurple : isToday ? Colors.blue.withOpacity(0.1) : null,
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : isToday ?AllColors.mediumPurple : null,
                ),
              ),
            ),
          ),
        );
      },
    ),
  ));

  Widget _buildCalendarButtons() => Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: controller.clearDate,
          child: const Text('Clear', style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: controller.setToday,
          child: const Text('Today', style: TextStyle(color: Colors.blue)),
        ),
      ],
    ),
  );

  Widget _buildRenewingSection() => Obx(() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Checkbox(
            value: controller.isRenewing.value,
            onChanged: (value) => controller.isRenewing.value = value ?? false,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor:AllColors.mediumPurple,
          ),
          Text(
            'Is Renewing by Previous Service',
            style: TextStyle(fontSize: 12, color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
        ],
      ),
      if (controller.isRenewing.value) ...[
        const SizedBox(height: 10),
        TextField(
          controller: controller.previousServiceController,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            hintText: 'Previous Service',
            hintStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxHeight: 40),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[400], size: 17),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
          ),
        ),
      ],
    ],
  ));

  Widget _buildAddServiceButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor:  AllColors.mediumPurple,
      minimumSize: const Size(double.infinity, 35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    ),
    onPressed: controller.addService,
    child: Text(
      'Add Service',
      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

// Usage
void showServicesDialog(BuildContext context, List<Services> services) {
  Get.put(ServicesController());
  Get.dialog(const ServicesDialog());
}