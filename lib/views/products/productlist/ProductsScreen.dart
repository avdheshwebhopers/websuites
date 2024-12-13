import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/button/CustomButton.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../viewModels/product/list/product_list_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import 'package:websuites/data/models/responseModels/products/list/products_list_response_model.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final SaveUserData preference = SaveUserData();
  final ProductListViewModel viewModel = Get.put(ProductListViewModel());

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    viewModel.productList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: CustomDrawer(
      //   userName: userName,
      //   phoneNumber: userEmail,
      //   version: '1.0.12',
      // ),
      appBar:
      AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro),), Spacer(),


            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width * 0.16),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AllColors.grey,width: 0.3),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset('assets/icons/FilterIcon.png',width: 10,height: 12,),
                    Icon(Icons.filter,size: 14,),
                    SizedBox(width: 5,),

                    Text(
                      'Filter',
                      style: TextStyle(
                        color: AllColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),


                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10,),
            CustomButton(

                width: 70,
                height: 22,
                borderRadius: 54,
                child:
                InkWell(
                  onTap: (){
                    _showAddProductBottomSheet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: AllColors.whiteColor,size: 18,),
                      SizedBox(width: 5,),
                      Text('Add',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: FontFamily.sfPro),),
                    ],
                  ),
                ), onPressed: (){})


          ]
        ),
      ),

      body: Obx(() {
        if (viewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return
          Padding(
            padding: const EdgeInsets.only(right: 14,left: 14,top: 10),
            child: ListView.builder(
              itemCount: viewModel.products.length,
              itemBuilder: (context, index) {
                final product = viewModel.products[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10), // Space between items
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
                        children: [
                          Expanded(
                            child: Text(
                              product.name ?? 'Unknown Product',
                              style: TextStyle(
                                fontFamily: FontFamily.sfPro,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Total Rate: ₹${product.salePrice}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.sfPro,
                            ),
                          ),
                        ],
                      ),
                      if (product.brand != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Brand: ${product.brand?.name}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro,
                          ),
                        ),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Implement edit functionality here
                            },
                            icon: const Icon(Icons.edit, size: 19),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );

      }),
    );
  }


  void _showAddProductBottomSheet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Optional, to make the dialog corners rounded
          ),
          backgroundColor: Colors.white, // Set the background color to white
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.sfPro,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Name *'),
                  CreateNewLeadScreenCard(
                    containerPadding: EdgeInsets.only(top: 5, bottom: 5),
                    hintText: 'Product Name',
                    allowCustomBorderInput: BorderRadius.circular(30),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 8),
                  Text('Product Type *'),
                  CreateNewLeadScreenCard(
                    containerPadding: EdgeInsets.only(top: 5, bottom: 5),
                    hintText: 'Enter Title',
                    allowCustomBorderInput: BorderRadius.circular(30),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          width: 70,
                          height: 22,
                          borderRadius: 54,
                          child: InkWell(
                            onTap: () {
                              _showAddProductBottomSheet();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: 20),
                        CustomButton(
                          backgroundColor: Colors.red,
                          width: 70,
                          height: 22,
                          borderRadius: 54,
                          child: InkWell(
                            onTap: () {
                              _showAddProductBottomSheet();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}