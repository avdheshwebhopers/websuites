import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import '../../../data/models/requestModels/sales/projection/update/SalesUpdateProjectionReqModel.dart';
import '../../../data/models/responseModels/sales/projection/update/SalesUpdateProjectionListResponseModel.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../viewModels/sales/projection/SalesProjectionViewModel.dart';
import '../../../viewModels/sales/projection/update/SalesUpdateProjectionViewModel.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class SaleProjectionScreen extends StatefulWidget {
  const SaleProjectionScreen({super.key});

  @override
  State<SaleProjectionScreen> createState() => _SaleProjectionScreenState();
}

class _SaleProjectionScreenState extends State<SaleProjectionScreen> {
  late final SalesProjectionViewModel controller;
  late final SalesUpdateProjectionViewModel updateController;

  @override
  void initState() {
    super.initState();

    // Initialize both view models
    if (!Get.isRegistered<SalesProjectionViewModel>()) {
      final repositories = Get.put(Repositories());
      Get.put(SalesProjectionViewModel(repository: repositories));
    }
    if (!Get.isRegistered<SalesUpdateProjectionViewModel>()) {
      Get.put(SalesUpdateProjectionViewModel());
    }

    controller = Get.find<SalesProjectionViewModel>();
    updateController = Get.find<SalesUpdateProjectionViewModel>();

    controller.fetchSalesProjections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            const Text("Sales Projections",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro),),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.salesProjections.isEmpty) {
          return const Center(
            child: Text('No sales projections available'),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchSalesProjections(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.salesProjections.length,
            itemBuilder: (context, index) {
              final projection = controller.salesProjections[index];
              return Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row 1: Product Category and Date
                      Row(
                        children: [
                          Text(
                            '${projection.productCategory?.name ?? 'N/A'}',
                            style: TextStyle(fontFamily: FontFamily.sfPro, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Image.asset('assets/icons/date.png', height: 14, width: 14),
                          SizedBox(width: 5),
                          Text(
                            '${formatDateWithDay(projection.createdAt ?? 'N/A')}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro, color: AllColors.mediumPurple),
                          ),
                        ],
                      ),

                      // Space between Row 1 and Row 2
                      SizedBox(height: 5),

                      // Row 2: Product and Amount
                      Row(
                        children: [
                          Text(
                            'Product: ',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: FontFamily.sfPro, color: AllColors.blackColor),
                          ),
                          Text(
                            '${projection.product?.name ?? 'N/A'}',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro, color: AllColors.figmaGrey),
                          ),
                          Spacer(),
                          Text('₹${projection.amount}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17, color: AllColors.figmaGrey)),
                        ],
                      ),

                      // Space between Row 2 and Row 3
                      SizedBox(height: 5),

                      // Row 3: Projection Date
                      Row(
                        children: [
                          Icon(Icons.auto_graph, color: AllColors.mediumPurple, size: 20),
                          Text(
                            ' ${formatDateWithDay(projection.projectionDate ?? 'N/A')}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro, color: AllColors.mediumPurple),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Divider(thickness: 0.4,),
                      Row(
                        children: [
                          Icon(Icons.personal_injury, color: AllColors.mediumPurple, size: 20),
                          SizedBox(width: 5),
                          Text(
                            '${projection.lead?.firstName ?? 'N/A'}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro, color: AllColors.figmaGrey),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              final updatedProjection = SalesUpdateProjectionListResponseModel(
                                id: projection.id,
                                amount: projection.amount,
                                isClosed: projection.isClosed,
                                status: projection.status,
                                projectionDate: projection.projectionDate,
                                createdAt: projection.createdAt,
                                updatedAt: projection.updatedAt,
                                productCategory: projection.productCategory,
                                product: projection.product,
                                lead: projection.lead,
                                customer: projection.customer,
                                createdBy: projection.createdBy,
                              );
                              _showDialog(context, updatedProjection);
                            },
                            icon: Image.asset('assets/icons/edit.png', height: 17, width: 17),
                          ),
                        ],
                      ),
                    ],
                  )

                ),
              );
            },
          ),
        );
      }),
    );
  }

  void _showDialog(BuildContext context, SalesUpdateProjectionListResponseModel projection) {
    TextEditingController dateController = TextEditingController();
    TextEditingController amountController = TextEditingController(text: projection.amount?.toString());
    TextEditingController productController = TextEditingController(text: projection.product?.name);
    TextEditingController categoryController = TextEditingController(text: projection.productCategory?.name);

    if (projection.projectionDate != null) {
      try {
        DateTime parsedDate = DateTime.parse(projection.projectionDate!);
        dateController.text = DateFormat('dd-MM-yyyy').format(parsedDate);
      } catch (e) {
        dateController.text = projection.projectionDate!;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Edit Sales Projection',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Amount'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Amount',
                    controller: amountController,
                  ),
                  SizedBox(height: 10),
                  Text('Product'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Product',
                    controller: productController,
                  ),
                  SizedBox(height: 10),
                  Text('Product Category'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Category',
                    controller: categoryController,
                  ),
                  SizedBox(height: 10),
                  Text('Select Date'),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      DateTime initialDate = DateTime.now();
                      if (dateController.text.isNotEmpty) {
                        try {
                          List<String> dateParts = dateController.text.split('-');
                          initialDate = DateTime(
                            int.parse(dateParts[2]),
                            int.parse(dateParts[1]),
                            int.parse(dateParts[0]),
                          );
                        } catch (e) {
                          initialDate = DateTime.now();
                        }
                      }

                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: CreateNewLeadScreenCard(
                        hintText: 'Select Date',
                        controller: dateController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child:
                      CustomButton(
                        width: 80,
                        height: 30,
                        borderRadius: 25,
                        onPressed: () async {
                          // Convert date format from dd-MM-yyyy to yyyy-MM-dd
                          String formattedDate = '';
                          try {
                            List<String> dateParts = dateController.text.split('-');
                            formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}'; // yyyy-MM-dd
                          } catch (e) {
                            print('Error formatting date: $e');
                            return;
                          }

                          // Parse amount to integer
                          int? amount;
                          try {
                            amount = int.parse(amountController.text);
                          } catch (e) {
                            print('Error parsing amount: $e');
                            return;
                          }

                          // Call the update projection method
                          final viewModel = Get.find<SalesUpdateProjectionViewModel>();
                          bool success = await viewModel.salesUpdateProjection(
                            projection.id ?? '',  // Use the projection ID
                            formattedDate,
                            amount,
                          );

                          if (success) {
                            // Refresh the projections list
                            controller.fetchSalesProjections();
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Update', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
