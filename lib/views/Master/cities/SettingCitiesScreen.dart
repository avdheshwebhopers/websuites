import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../../../data/models/responseModels/master/proposals/master_proposals_resposne_model.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../viewModels/master/citiesStatesAndCountry/cities/master_cities_viewModel.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';


class SettingCitiesScreen extends StatefulWidget {
  const SettingCitiesScreen({super.key});

  @override
  State<SettingCitiesScreen> createState() => _SettingCitiesScreenState();
}

class _SettingCitiesScreenState extends State<SettingCitiesScreen> {
  final MasterCitiesViewModel _viewModel = Get.put(MasterCitiesViewModel());

  @override
  void initState() {
    super.initState();
    _viewModel.masterCities(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cities',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
        ),
      ),
      body: Obx(() {
        if (_viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final citiesData = _viewModel.citiesData.value;
        if (citiesData?.items == null || citiesData!.items!.isEmpty) {
          return Center(child: Text('No cities found'));
        }

        return ListView.builder(
          itemCount: citiesData.items!.length,
          itemBuilder: (context, index) {
            final city = citiesData.items![index];

            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding: const EdgeInsets.all(15),
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
                      children: [
                        Expanded(
                          child: Text(
                            city.name ?? 'Unknown City',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.sfPro
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                          decoration: BoxDecoration(
                            color: AllColors.background_green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                          city.status ?? 'N/A',
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
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 15,
                            color: AllColors.mediumPurple
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '${city.state?.name ?? 'Unknown State'}, ${city.state?.country?.name ?? 'Unknown Country'}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.sfPro,
                                color: AllColors.figmaGrey
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.date_range,
                            size: 15,
                            color: AllColors.mediumPurple
                        ),
                        SizedBox(width: 5),
                        Text(
                          formatDateWithDay(city.createdAt ?? 'N/A'),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.sfPro,
                              color: AllColors.mediumPurple
                          ),
                        ),
                        Spacer(),
                        SizedBox(width: 15,),
                      IconButton(onPressed: (){

                        _showBox(context);
                      }, icon:   Image.asset('assets/icons/edit.png', height: 17, width: 17))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  } void _showBox(BuildContext context) {

    TextEditingController name =   TextEditingController();
    TextEditingController status =   TextEditingController();
    TextEditingController state =   TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Edit City',
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
                Text(
                  'City Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.sfPro,
                    color: AllColors.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                    hintText: 'Enter City Name',
                  controller: name,
                ),
                SizedBox(height: 5),
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.sfPro,
                    color: AllColors.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  hintText: 'Status',
                  controller: status,
                  categories: [
                  "hello", "hello""hello"
                ],),
                SizedBox(height: 5),
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.sfPro,
                    color: AllColors.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  hintText: 'Enter State',
                  controller: state,

                  categories: ["punjab", "punjab""punjab"
                ],),
                SizedBox(height: 20),
                CustomButton(
                  width: 80,
                  height: 30,
                  borderRadius: 25,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.sfPro,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

