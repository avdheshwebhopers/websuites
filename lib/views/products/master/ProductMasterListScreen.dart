import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';

import '../../../../utils/appColors/app_colors.dart';
import '../../../../utils/button/CustomButton.dart';
import '../../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../../utils/fontfamily/FontFamily.dart';
import '../../../../viewModels/product/master/product_master_viewModel.dart';
import '../../../../viewModels/saveToken/save_token.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class ProductMasterListScreen extends StatefulWidget {
  const ProductMasterListScreen({super.key});

  @override
  State<ProductMasterListScreen> createState() => _ProductMasterListScreenState();
}

class _ProductMasterListScreenState extends State<ProductMasterListScreen> {
  final ProductMasterViewModel _viewModel = Get.put(ProductMasterViewModel());
  SaveUserData userPreference = SaveUserData();
  String searchQuery = '';
  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();
    _viewModel.productMaster(context); // Call the API to fetch data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: CustomDrawer(
      //   userName: '$userName',
      //   phoneNumber: '$userEmail',
      //   version: '1.0.12',
      // ),
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Product Master',
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
                fontWeight: FontWeight.w700,
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
                // Add functionality for button press if needed
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: CreateNewLeadScreenCard(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search, color: AllColors.mediumPurple, size: 20),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase(); // Update the search query
                    _viewModel.filterMasterList(searchQuery); // Call the filter method
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Text('Product Incentive',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: FontFamily.sfPro,fontSize: 16),),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (_viewModel.loading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: _viewModel.filteredItems.length, // Use filteredItems instead of items
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = _viewModel.filteredItems[index]; // Get the filtered item
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  item.product?.name ?? 'Unnamed Product',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: FontFamily.sfPro,
                                    fontWeight: FontWeight.w700,
                                  ),
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
                                  item.product?.status == true ? 'Active' : 'Inactive',
                                  style: TextStyle(
                                    color: AllColors.text__green,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Text('IS ON SALE ? - ', style: TextStyle(fontSize: 12, fontFamily: FontFamily.sfPro, fontWeight: FontWeight.w600)),
                              Text(
                                item.is_sale == true ? 'YES' : 'NO',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AllColors.figmaGrey,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                decoration: BoxDecoration(
                                  color: item.incentive_type == 'percentage' ? Colors.orange : AllColors.lighterPurple,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  item.incentive_type == 'percentage' ? 'Percentage' : 'Flat',
                                  style: TextStyle(
                                    color: item.incentive_type == 'percentage' ? Colors.white : AllColors.mediumPurple,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range, color: AllColors.mediumPurple, size: 15),
                              SizedBox(width: 4),
                              Text(
                                formatDateWithTime(item.created_at ?? 'Unknown Date'),
                                style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text('QUANTITY : ', style: TextStyle(fontSize: 12, fontFamily: FontFamily.sfPro, fontWeight: FontWeight.w600)),
                              Text(
                                item.product?.quantity != null && item.product?.quantity != 0 ? '${item.product?.quantity}' : 'N/A',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AllColors.figmaGrey,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Text('INCENTIVE : ', style: TextStyle(fontSize: 12, fontFamily: FontFamily.sfPro, fontWeight: FontWeight.w600)),
                              Text(
                                item.incentive != null ? '${item.incentive} %' : 'N/A',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AllColors.figmaGrey,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text('MIN SALE PRICE : ', style: TextStyle(fontSize: 12, fontFamily: FontFamily.sfPro, fontWeight: FontWeight.w600)),
                              Text(
                                item.minimum_sale_price != null ? '₹ ${item.minimum_sale_price}' : 'N/A',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AllColors.figmaGrey,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 0.5, height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DESCRIPTION : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.sfPro,fontSize: 14,
                                ),
                              ),
                              Text(
                                item.product?.description ?? 'N/A',
                                style: TextStyle(
                                  color: AllColors.figmaGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.edit, size: 16,)
                            ],
                          ),
                          SizedBox(height: 5),
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