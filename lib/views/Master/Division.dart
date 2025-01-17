import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../../../viewModels/master/divisions/master_divisions_viewModel.dart';
import '../../Utils/utils.dart';
import '../../data/models/requestModels/master/division/add_division/AddDivisionRequestModels.dart';
import '../../data/models/requestModels/master/division/update/UpdateDivisionRequestModels.dart';
import '../../data/models/responseModels/master/divisions/add_division/AddDivisionResponseModels.dart';
import '../../data/models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../../data/models/responseModels/master/divisions/update/UpdateDivisionListResponseModel.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/button/CustomButton.dart';
import '../../utils/fontfamily/FontFamily.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:file_picker/file_picker.dart';
import '../../viewModels/master/divisions/add_Divisions/AddDivisionViewModels.dart';
import '../../viewModels/master/divisions/update_division/UpdateDivisionListViewModel.dart';
import '../../viewModels/master/divisions/update_division/UpdateDivisionViewModel.dart';

class MasterDivisionScreen extends StatefulWidget {
  const MasterDivisionScreen({super.key});

  @override
  _MasterDivisionScreenState createState() => _MasterDivisionScreenState();
}

class _MasterDivisionScreenState extends State<MasterDivisionScreen> {
  final AddDivisionViewModels _userAddDepartmentViewModel =
      Get.put(AddDivisionViewModels()); // Use UserDepartmentViewModel

  final MasterDivisionsViewModel divisionViewModel =
      Get.put(MasterDivisionsViewModel());

  final UpdateDivisionViewModel _userUpdateDivisionViewModel =
      Get.put(UpdateDivisionViewModel()); // Use UserDepartmentViewModel

  final UpdateDivisionListViewModel _divisionUpdateListViewModel =
      Get.put(UpdateDivisionListViewModel()); // Use UserDepartmentViewModel

  String? _fileName; // Variable to hold the name of the uploaded file

  Country? _selectedCountry;
  TextEditingController phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    // Set the default selected country to India
    _selectedCountry = Country(
      countryCode: 'IN',
      e164Sc: 91,
      geographic: true,
      level: 1,
      example: '91 12345 67890',
      displayName: 'India',
      displayNameNoCountryCode: 'India',
      e164Key: 'IN',
      phoneCode: '91',
      // Set the phone code here
      name: 'India',
    );
  }

  @override
  Widget build(BuildContext context) {
    final MasterDivisionsViewModel divisionViewModel =
        Get.put(MasterDivisionsViewModel());

    divisionViewModel.masterDivisions(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: AllColors.whiteColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Divisions',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
              ),
            ),
            Spacer(),
            CustomButton(
              width: 70,
              height: 22,
              borderRadius: 54,
              onPressed: () {
                AddDivisionResponseModels addDivision =
                    AddDivisionResponseModels();
                _showDialog(
                    context); // Call the dialog method when Add button is pressed
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
      body: Center(
        child: Obx(() {
          final divisions = divisionViewModel.divisions;

          if (divisionViewModel.loading.value && divisions.isEmpty) {
            return const CircularProgressIndicator(); // Show loading indicator only if data is being fetched
          }

          if (divisions.isEmpty) {
            return const Text(
                'No divisions available'); // Show message if no data is available
          }

          return RefreshIndicator(
            onRefresh: () => divisionViewModel.refreshData(context),
            // Trigger refresh
            child: ListView.builder(
              itemCount: divisions.length,
              itemBuilder: (context, index) {
                var division = divisions[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child:
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.only(top:10,bottom: 5,left: 15,right: 15),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 12,
                                child: Text(division.name ?? 'No Date',style: TextStyle(fontFamily: FontFamily.sfPro,fontWeight: FontWeight.w700,fontSize: 17),)),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: division.status == 'InActive' ? AllColors.lightRed: AllColors.background_green,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                division.status ?? 'N/A',
                                style: TextStyle(
                                  color: division.status == 'InActive' ? Colors.red[800] : AllColors.text__green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('assets/icons/date.png',height: 14,width: 14,),
                            SizedBox(width: 10,),
                            Text(formatDateWithDay(
                                division.createdAt ?? 'N/A'),style: TextStyle(color: AllColors.mediumPurple),),
                            Spacer(),
                            IconButton(
                              onPressed: () async {
                                await _divisionUpdateListViewModel
                                    .updateDivisionList(
                                        context, division.id.toString());

                                if (_divisionUpdateListViewModel
                                    .division.value.isNotEmpty) {
                                  final UpdateDivisionListResponseModel
                                      updateDivision =
                                      _divisionUpdateListViewModel
                                          .division.value.first;
                                  _showDialog2(
                                      division.id.toString(), updateDivision);
                                } else {
                                  // Utils.snackbarFailed('Failed to fetch division details');
                                }
                              },
                              icon: Image.asset('assets/images/edit.png',width: 25,height: 25,color: AllColors.grey,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  void _showDialog2(String divisionId, UpdateDivisionListResponseModel division) {
    if (divisionId.isEmpty) return; // Check if divisionId is not empty

    String? selectedStatus = division.status;

    Country? tempSelectedCountry = _selectedCountry;
    final TextEditingController nameController =
        TextEditingController(text: division.name);
    final TextEditingController contactPersonName =
        TextEditingController(text: division.contactPerson);
    final TextEditingController email =
        TextEditingController(text: division.email);
    final TextEditingController address =
        TextEditingController(text: division.address);
    final TextEditingController phoneController =
        TextEditingController(text: division.mobileNo);
    TextEditingController _fileNameController =
        TextEditingController(text: division.logo);
    String? filePath; // Variable to hold the file path

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              'Edit Division',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.sfPro,
                                color: AllColors.blackColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Name'),
                          SizedBox(height: 5),
                          CreateNewLeadScreenCard(
                            hintText: 'Enter Name',
                            controller: nameController,
                          ),
                          SizedBox(height: 5),
                          Text('Contact Person Name'),
                          SizedBox(height: 5),
                          CreateNewLeadScreenCard(
                            hintText: 'Enter Contact Person Name',
                            controller: contactPersonName,
                          ),
                          SizedBox(height: 5),
                          Text('Email'),
                          SizedBox(height: 5),
                          CreateNewLeadScreenCard(
                            hintText: 'Enter Email',
                            controller: email,
                          ),
                          SizedBox(height: 5),
                          Text('Status'),
                          SizedBox(height: 5),
                          //
                          // DropdownButton<String>(
                          //   value: selectedStatus,
                          //   hint: Text('Select Status'),
                          //   items: <String>['Active', 'InActive']
                          //       .map((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       selectedStatus =
                          //           newValue; // Update the selected status
                          //     });
                          //   },
                          // ),


                          CreateNewLeadScreenCard(
                            hintText: 'Status',
                            categories: ['Active', 'Inactive'], // Populate categories
                            value: selectedStatus, // Pass the selected value
                            onCategoryChanged: (String? newValue) {
                              setState(() {
                                selectedStatus = newValue; // Update the selected status
                              });
                            },
                          ),
                          SizedBox(height: 5),
                          Text('Mobile Number'),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        onSelect: (Country country) {
                                          setState(() {
                                            tempSelectedCountry = country;
                                            _selectedCountry =
                                                country; // Update the selected country
                                          });
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        if (tempSelectedCountry != null) ...[
                                          Text(
                                            tempSelectedCountry!.flagEmoji,
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Icon(Icons.arrow_drop_up),
                                        ] else
                                          Text('Select'),
                                        Container(
                                          width: 1,
                                          height: double.infinity,
                                          color: Colors.grey,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style:
                                        TextStyle(color: AllColors.figmaGrey),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter mobile number',
                                      hintStyle:
                                          TextStyle(color: AllColors.figmaGrey),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 9),
                                      prefix: tempSelectedCountry != null
                                          ? Text(
                                              '+${tempSelectedCountry!.phoneCode} ',
                                              style: TextStyle(
                                                  color: AllColors.figmaGrey),
                                            )
                                          : Text(
                                              '+91 ',
                                              style: TextStyle(
                                                  color: AllColors.figmaGrey),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Address'),
                          SizedBox(height: 5),
                          CreateNewLeadScreenCard(
                            hintText: 'Enter Address',
                            controller: address,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              CustomButton(
                                height: Get.height / 28,
                                width: 100,
                                backgroundColor: AllColors.greyGoogleForm,
                                child: Text(
                                  'Choose files',
                                  style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    setState(() {
                                      filePath = result.files.first
                                          .path; // Store the file path
                                      _fileNameController.text = result
                                          .files
                                          .first
                                          .name; // Update the controller's text
                                    });
                                  }
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 9.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    _fileNameController.text.isNotEmpty
                                        ? _fileNameController.text
                                        : 'No file selected',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                backgroundColor: Colors.grey,
                                width: 80,
                                height: 30,
                                borderRadius: 25,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                  ),
                                ),
                              ),
                              CustomButton(
                                width: 80,
                                height: 30,
                                borderRadius: 25,
                                onPressed: () async {
                                  if (tempSelectedCountry != null &&
                                      phoneController.text.isNotEmpty) {
                                    String fullPhoneNumber =
                                        '+${tempSelectedCountry!.phoneCode}${phoneController.text}';

                                    // Create the update model
                                    UpdateDivisionRequestModels updateDivision =
                                        UpdateDivisionRequestModels(
                                      name: nameController.text,
                                      mobileNo: fullPhoneNumber,
                                      contactPerson: contactPersonName.text,
                                      email: email.text,
                                      status: selectedStatus,
                                      // Use the selected status from the dropdown
                                      address: address.text,
                                      logo:
                                          filePath, // Use the actual file path for the logo
                                    );

                                    // Call the update API
                                    await _userUpdateDivisionViewModel
                                        .updateDivisionSettingApi(
                                            context,
                                            divisionId,
                                            updateDivision,
                                            filePath);

                                    Navigator.of(context).pop();
                                  } else {
                                    Utils.snackbarFailed(
                                        'Please enter a valid phone number and select a file if needed');
                                  }
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    top: -10,
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    Country? tempSelectedCountry = _selectedCountry;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController contactPersonName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController _fileNameController = TextEditingController(); // Controller for the file name
    String? filePath; // Variable to hold the file path

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
                      'Add New Division',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.sfPro,
                        color: AllColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Name Field
                  Text('Name'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Name',
                    controller: nameController,
                  ),
                  SizedBox(height: 5),
                  // Contact Person Name Field
                  Text('Contact Person Name'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Contact Person Name',
                    controller: contactPersonName,
                  ),
                  SizedBox(height: 5),
                  // Email Field
                  Text('Email'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Email',
                    controller: email,
                  ),
                  SizedBox(height: 5),
                  // Mobile Number Field
                  Text('Mobile Number'),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                setState(() {
                                  tempSelectedCountry = country;
                                  _selectedCountry = country; // Update the selected country
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                if (tempSelectedCountry != null) ...[
                                  Text(tempSelectedCountry!.flagEmoji, style: TextStyle(fontSize: 24)),
                                  Icon(Icons.arrow_drop_up),
                                ] else
                                  Text('Select'),
                                Container(
                                  width: 1,
                                  height: double.infinity,
                                  color: Colors.grey,
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            style: TextStyle(color: AllColors.figmaGrey),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter mobile number',
                              hintStyle: TextStyle(color: AllColors.figmaGrey),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                              prefix: tempSelectedCountry != null
                                  ? Text('+ ${tempSelectedCountry!.phoneCode} ', style: TextStyle(color: AllColors.figmaGrey))
                                  : Text('+91 ', style: TextStyle(color: AllColors.figmaGrey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  // Address Field
                  Text('Address'),
                  SizedBox(height: 5),
                  CreateNewLeadScreenCard(
                    hintText: 'Enter Address',
                    controller: address,
                  ),
                  SizedBox(height: 20),
                  // File Picker
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
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              _fileNameController.text = result.files.first.name; // Update the controller's text
                              filePath = result.files.first.path; // Store the file path
                            });
                          }
                        },
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
                            _fileNameController.text.isNotEmpty ? _fileNameController.text : 'No file selected',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        backgroundColor: Colors.grey,
                        width: 80,
                        height: 30,
                        borderRadius: 25,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro),
                        ),
                      ),
                      CustomButton(
                        width: 80,
                        height: 30,
                        borderRadius: 25,
                        onPressed: () async {
                          if (tempSelectedCountry != null && phoneController.text.isNotEmpty) {
                            String fullPhoneNumber = '+${tempSelectedCountry!.phoneCode}${phoneController.text}';

                            // Create an instance of AddDivisionRequestModels
                            AddDivisionRequestModels newDivision = AddDivisionRequestModels(
                              name: nameController.text,
                              mobileNo: fullPhoneNumber,
                              contactPerson: contactPersonName.text,
                              email: email.text,
                              address: address.text,
                              logo: filePath, // Use the file path for the logo
                            );

                            // Call the API to add the division
                            await _userAddDepartmentViewModel.addDivisionSettingApi(context, newDivision, filePath);

                            // Close the dialog
                            Navigator.of(context).pop();
                          } else {
                            // Show an error message if the phone number is not valid
                            Utils.snackbarFailed('Please enter a valid phone number');
                          }
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro),
                        ),
                      ),
                    ],
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
