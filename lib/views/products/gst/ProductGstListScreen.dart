import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../viewModels/saveToken/save_token.dart';
import 'package:websuites/viewModels/product/gstList/product_gstList_viewModel.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class ProductGstListScreen extends StatefulWidget {
  const ProductGstListScreen({super.key});

  @override
  State<ProductGstListScreen> createState() => _ProductGstListScreenState();
}

class _ProductGstListScreenState extends State<ProductGstListScreen> {
  final ProductGstListViewModel _viewModel = Get.put(ProductGstListViewModel());
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _viewModel.fetchProductGstList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(
      //     userName: '$userName',
      //     phoneNumber: '$userEmail',
      //     version: '1.0.12'
      // ),
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Product Gst',
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
                fontWeight : FontWeight.w700,
              ),
            ),
            Spacer(),
            Icon(Icons.search, color: AllColors.lightGrey),
            SizedBox(width: 15),
            CustomButton(
              width: 70,
              height: 22,
              borderRadius: 54,
              onPressed: () {
                // _showDialog()
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AllColors.whiteColor, size: 18),
                  SizedBox(width: 5),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.sfPro,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: CreateNewLeadScreenCard(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search, color: AllColors.mediumPurple, size: 20),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase(); // Update the search query
                    _viewModel.filterProductGstList(searchQuery); // Call the filter method
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (_viewModel.loading.value) {
                return Center(child: CircularProgressIndicator());
              }

              // Use the filtered list instead of the original list
              final filteredList = _viewModel.filteredProductGstList;

              if (filteredList.isEmpty) {
                return Center(child: Text('No products found.'));
              }

              return ListView.builder(
                itemCount: filteredList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final productGst = filteredList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name and Status
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productGst.name ?? 'Unnamed Product',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                decoration: BoxDecoration(
                                  color: AllColors.background_green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  productGst.status == 1 ? 'Active' : 'Inactive',
                                  style: TextStyle(
                                    color: productGst.status == 1 ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Add some vertical spacing between rows
                          SizedBox(height: 10),

                          // Date
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range, color: AllColors.mediumPurple, size: 15),
                              SizedBox(width: 5),
                              Text(
                                formatDateToLongMonth(productGst.created_at ?? 'Unknown Date'),
                                style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),

                            ],
                          ),

                          // Add some vertical spacing between rows
                          SizedBox(height: 10),

                          // SGST, CGST, IGST
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SGST
                              Text(
                                'SGST: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${productGst.sgst ?? '0'}%', // Data in grey, removed '$' symbol
                                style: TextStyle(
                                  color: AllColors.figmaGrey, // Data in grey
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),

                              Spacer(),
                              // CGST
                              Text(
                                'CGST: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${productGst.cgst ?? 0}',
                                style: TextStyle(
                                  color: AllColors.figmaGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),

                              Spacer(),
                              // IGST
                              Text(
                                'IGST: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${productGst.igst ?? 0}',
                                style: TextStyle(
                                  color: AllColors.figmaGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),

                              Spacer(),
                              Icon(Icons.edit, size: 17),
                            ],
                          ),

                          // Divider for better separation
                          Divider(thickness: 0.5, height: 30),
                        ],
                      ),


                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}