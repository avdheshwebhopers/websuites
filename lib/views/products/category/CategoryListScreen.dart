import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../viewModels/product/category/product_category_viewModel.dart';
import 'package:file_picker/file_picker.dart';

import '../../../viewModels/saveToken/save_token.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  bool showAttachmentError = false;
  Map<String, dynamic>? attachment;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _parentCategoryController = TextEditingController();
  String? nameError;
  String? descriptionError;

  final ProductCategoryViewModel _viewModel = Get.put(ProductCategoryViewModel());

  bool _isValidUrl(String url) {
    final Uri? uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';
  @override
  void initState() {
    super.initState();
    _viewModel.productCategory(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _parentCategoryController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _nameController.clear();
    _descriptionController.clear();
    _parentCategoryController.clear();
    setState(() {
      attachment = null;
      showAttachmentError = false;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AllColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
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
                              'Add New Product Category',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),
                            SizedBox(height: 20),

                            // Name Field
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
                              hasError: nameError != null, // Pass error state

                              containerHeight: 40,
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            if (nameError != null) // Show error message if exists
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  nameError!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            SizedBox(height: 16),

// Description Field
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
                              hasError: nameError != null, // Pass error state

                              prefixIcon: Icon(Icons.description, color: AllColors.grey, size: 18),
                              containerHeight: 40,
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            if (descriptionError != null) // Show error message if exists
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  descriptionError!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            SizedBox(height: 16),
                            // Parent Categories Field
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Parent Categories ',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            CreateNewLeadScreenCard(
                              controller: _parentCategoryController,
                              hintText: 'Parent Categories',
                              containerHeight: 40,
                              prefixIcon: Icon(Icons.category_sharp, color: AllColors.grey, size: 18),
                              containerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              textFieldPadding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            SizedBox(height: 16),

                            // File Upload Section
                            Row(
                              children: [
                                Icon(Icons.upload, size: 14),
                                SizedBox(width: 4),
                                Text('Upload', style: TextStyle(fontSize: 14)),
                                Text('*', style: TextStyle(fontSize: 14, color: Colors.red)),
                                Text(' ( Ideal Size of icon is 50*26 )', style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                CustomButton(
                                  height: Get.height / 34,
                                  width: 100,
                                  backgroundColor:
                                  AllColors.greyGoogleForm,
                                  child: Text('Choose files',
                                      style: TextStyle(
                                          color: AllColors.blackColor,
                                          fontSize: 12)),
                                  onPressed: () async {
                                    FilePickerResult? result =
                                    await FilePicker.platform
                                        .pickFiles();
                                    if (result != null) {
                                      setState(() {
                                        attachment = {
                                          'file':
                                          result.files.single.path,
                                          'name':
                                          result.files.single.name,
                                        };
                                        showAttachmentError = false;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 6.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      attachment != null
                                          ? attachment!['name']
                                          : 'No file chosen',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            if (showAttachmentError)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'File is required',
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),

                            // Buttons
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
                                        nameError = null; // Reset error messages
                                        descriptionError = null;
                                      });

                                      // Validate Name
                                      if (_nameController.text.isEmpty) {
                                        setState(() {
                                          nameError = 'Name is required';
                                        });
                                      }

                                      // Validate Description
                                      if (_descriptionController.text.isEmpty) {
                                        setState(() {
                                          descriptionError = 'Description is required';
                                        });
                                      }

                                      // Check if there are any errors
                                      if (nameError == null && descriptionError == null) {
                                        if (attachment == null) {
                                          setState(() {
                                            showAttachmentError = true;
                                          });
                                          return;
                                        }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: CustomDrawer(
      //     userName: '$userName',
      //     phoneNumber: '$userEmail',
      //     version: '1.0.12'
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Product Categories',
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
              onPressed: _showDialog,
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (_viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_viewModel.categories.isEmpty) {
          return Center(child: Text('No categories found'));
        } else {
          return

            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                  child: CreateNewLeadScreenCard(
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search, color: AllColors.mediumPurple, size: 20),
                    onChanged: (value) {
                      _viewModel.searchCategories(value);
                    },
                  ),
                ),
                SizedBox(height: 10), // Space between the search card and the list
                // Expanded ListView that scrolls
                Expanded(
                  child:
                  ListView.builder(
                    itemCount: _viewModel.filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = _viewModel.filteredCategories[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
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
                                  Icon(Icons.edit),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.date_range, color: AllColors.mediumPurple, size: 12),
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
                                  // Uncomment and modify the following code if you want to display the category image
                                  // if (category.image != null && category.image!.isNotEmpty)
                                  //   Image.network(
                                  //     category.image!,
                                  //     width: 24,
                                  //     height: 19,
                                  //     errorBuilder: (context, error, stackTrace) {
                                  //       return Image.asset(
                                  //         'assets/images/data-not-found.png',
                                  //         width: 24,
                                  //         height: 19,
                                  //       );
                                  //     },
                                  //   ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

        }
      }),
    );
  }
}