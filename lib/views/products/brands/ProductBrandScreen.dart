import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../viewModels/product/brand/product_brand_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';


class ProductBrandListScreen extends StatefulWidget {
  const ProductBrandListScreen({super.key});

  @override
  State<ProductBrandListScreen> createState() => _ProductBrandListScreenState();
}

class _ProductBrandListScreenState extends State<ProductBrandListScreen> {
  final ProductBrandViewModel _viewModel = Get.put(ProductBrandViewModel());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';
  String? nameError;
  String? descriptionError;
  bool showAttachmentError = false;

  @override
  void initState() {
    super.initState();
    _viewModel.fetchProductBrands(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
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
              'Product Brands',
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


                _showDialog();
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
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: CreateNewLeadScreenCard(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search, color: AllColors.mediumPurple, size: 20),
                onChanged: (value) {
                  _viewModel.searchCategories(value);
                },
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (_viewModel.loading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: _viewModel.filteredCategories.length,
                shrinkWrap: true, // Add this line
                physics: NeverScrollableScrollPhysics(), // Add this line
                itemBuilder: (context, index) {
                  final category = _viewModel.filteredCategories[index];
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
                              Text(
                                category.name ?? 'Unnamed Category',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.edit,size: 18,),
                            ],
                          ),
                          SizedBox(height: 7,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range, color: AllColors.mediumPurple, size: 15),
                              SizedBox(width: 4),
                              Text(
                                formatDateToLongMonth(category.createdAt ?? 'Unknown Date'),
                                style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text(category.division?.name ?? 'N/A')
                            ],
                          ),
                          Divider(thickness: 0.5,height: 30,),
                          Row(
                            children: [
                              Text(
                               'DESCRIPTION:  ',
                                style: TextStyle(

                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                category.description ?? 'N/A',
                                style: TextStyle(
                                  color: AllColors.figmaGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
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

  void _showDialog() {
    showDialog(
      context : context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AllColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child:
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return
                SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Add New Brand',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Name ', style: TextStyle(fontSize: 14)),
                                  TextSpan(
                                    text: '* ',
                                    style: TextStyle(fontSize: 14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            CreateNewLeadScreenCard(
                              controller: _nameController,
                              hintText: 'Enter your name',
                              borderColor: AllColors.mediumPurple,
                              prefixIcon: Icon(Icons.person, color: AllColors.grey, size: 18),
                              hasError: nameError != null,
                              containerHeight: 40,
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            if (nameError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  nameError!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            SizedBox(height: 16),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Division ', style: TextStyle(fontSize: 14)),
                                  TextSpan(
                                    text: '* ',
                                    style: TextStyle(fontSize: 14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            CreateNewLeadScreenCard(
                              controller: _nameController,
                              hintText: 'Select Division',
                              borderColor: AllColors.mediumPurple,
                              prefixIcon: Icon(Icons.person, color: AllColors.grey, size: 18),
                              hasError: nameError != null,
                              containerHeight: 40,
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            if (nameError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  nameError!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            SizedBox(height: 16),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Description ', style: TextStyle(fontSize: 14)),
                                  TextSpan(
                                    text: '* ',
                                    style: TextStyle(fontSize: 14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            CreateNewLeadScreenCard(
                              controller: _descriptionController,
                              hintText: 'Description',
                              hasError: descriptionError != null,
                              prefixIcon: Icon(Icons.description, color: AllColors.grey, size: 18),
                              containerHeight: 40,
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            if (descriptionError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  descriptionError!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    height: Get.height / 34,
                                    width: 100,
                                    child: Text('Save',
                                        style: TextStyle(color: AllColors.whiteColor, fontSize: 12)),
                                    onPressed: () {
                                      setState(() {
                                        nameError = null;
                                        descriptionError = null;
                                      });

                                      if (_nameController.text.isEmpty) {
                                        setState(() {
                                          nameError = 'Name is required';
                                        });
                                      }

                                      if (_descriptionController.text.isEmpty) {
                                        setState(() {
                                          descriptionError = 'Description is required';
                                        });
                                      }

                                      if (nameError == null && descriptionError == null) {
                                        // Handle saving the new brand logic here
                                        _resetForm();
                                        Get.back();
                                      }
                                    },
                                  ),
                                  SizedBox(width: 40),
                                  CustomButton(
                                    backgroundColor: AllColors.whiteColor,
                                    height: Get.height / 34,
                                    width: 100,
                                    child: Text('Reset',
                                        style: TextStyle(color: AllColors.blackColor, fontSize: 12)),
                                    onPressed: () {
                                      _resetForm();
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Container(
                        height: 28,
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.black, size: 14),
                          onPressed: () {
                            _resetForm();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _resetForm() {
    _nameController.clear();
    _descriptionController.clear();
    nameError = null;
    descriptionError = null;
    showAttachmentError = false;
  }
}