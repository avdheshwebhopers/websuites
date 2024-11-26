import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Responsive/Custom_Drawer.dart';
<<<<<<< HEAD
import '../../../Utils/utils.dart';
=======

import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
>>>>>>> origin/main
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
<<<<<<< HEAD
import '../../../viewModels/customerScreens/companies/customer_companies_viewModel.dart';
=======
import '../../../utils/responsive/bodies/responsive scaffold.dart';
import '../../../viewModels/saveToken/save_token.dart';
>>>>>>> origin/main
import '../../customerScreens/companiesScreen/widgets/companiesCard/companies_screen_card.dart';

class CustomerCompaniesScreen extends StatefulWidget {
  const CustomerCompaniesScreen({Key? key}) : super(key: key);

  @override
  State<CustomerCompaniesScreen> createState() => _CustomerCompaniesScreenState();
}

class _CustomerCompaniesScreenState extends State<CustomerCompaniesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final CustomerCompaniesViewModel _viewModel = Get.put(CustomerCompaniesViewModel());

  @override
  void initState() {
    super.initState();
    _viewModel.companyList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,


      body: Obx(() {
        if (_viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_viewModel.companies.isEmpty) {
          return Center(child: Text('No companies found'));
        }

        return ListView.builder(
          itemCount: _viewModel.companies.length,
          itemBuilder: (context, index) {
            final company = _viewModel.companies[index];
            return CustomerCompaniesScreenCard(
              title: company.companyName ?? 'No Name',
              subTitle: company.contactPersonName ?? 'No Contact',
              email: company.companyEmail ?? 'No Email',
              mobile: '+${company.countryCode}-${company.companyPhone ??'No Phone'}',
              parentCompany: company.parent?.companyName ?? 'N/A',
              website: company.website != null && company.website!.isNotEmpty
                  ? company.website!
                  : 'No Website',
            );
          },
        );
      }),
    );
  }
}