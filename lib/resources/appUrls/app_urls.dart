class AppUrls {
  static const String baseurl = 'https://webhopers.whsuites.com:3006/';

  // static const  String  baseurl2 = 'https://dev.whsuites.com';

  //============================================================================
  // LOGIN SCREEN API

// //Dev login
//   static const String logindevApi='$baseurl/api/auth/signin';

  //Live Login
  static const String loginApi = '${baseurl}v1/api/auth/signin';

  //============================================================================
  // FORGOT PASSWORD API

  static const String forgotApi = '${baseurl}v1/api/authx/forgot-password';

  //============================================================================
  // HOME SCREEN API

  static const String dailyAnalyticsList = '${baseurl}api/analytics/sales/daily';
  static const String getDashboardCountApi = '${baseurl}v1/api/dashboard/dashboard-count';

  static const String dashboard = '${baseurl}v1/api/dashboard';

  static const String userListApi = 'https://webhopers.whsuites.com/api/auth/users-list';

  static const String dashLeadsByTypeCount =
      '${baseurl}v1/api/dashboard/leads-by-type-count';

  static const String dashLeadSource =
      '${baseurl}v1/api/dashboard/leads-by-source-count';

  static const String dashLeadsList = '${baseurl}v1/api/leads/list';

  static const String dashLatestCustomers = '${baseurl}v1/api/customers/list';

  static const String dashLatestTask = '${baseurl}v1/api/tasks/list';

  static const String dashTransactions =
      '${baseurl}v1/api/customer-payments/list';

  //============================================================================
  // LEAD SCREEN API
  // CREATE NEW LEAD API
  static const String leadList = '${baseurl}v1/api/leads/list';

  static const String leadAssign =
      'https://webhopers.whsuites.com/api/auth/users-list-and-search';
  static const String assignedLeadTo = '${baseurl}v1/api/auth/get-descendants';
  static const String createLead = '$baseurl/api/leads';

  static const String createNewLeadSource = '${baseurl}v1/api/lead-sources';

  static const String createNewLeadProductCategory =
      '${baseurl}v1/api/product-categories/list';

  static const String createNewLeadDivisions = '${baseurl}v1/api/divisions?q=';

  static const String createNewLeadCustomFields =
      '${baseurl}v1/api/lead-custom-fields';
  static const String createLeadPincode =
      '${baseurl}v1/api/city-pincodes/search?search=';
  static const String createNewLead =
      '${baseurl}https://webhopers.whsuites.com:3006/v1/api/leads';
  static const String leadListTrash = '${baseurl}v1/api/leads/delete_list';
  static const String leadListPhoneCode =
      "https://webhopers.whsuites.com/api/countries/phonecode";
  static const String leadType =
      'https://webhopers.whsuites.com/api/lead-types';
  static const String leadAssignsearch =
      'https://webhopers.whsuites.com/api/auth/users-list-and-search';
  static const String filterCity =
      "https://webhopers.whsuites.com/api/cities/list";

  //LEad import--------
  //Status
  static const String leadImportStatus = '${baseurl}/api/lead-status?q=';

// lead List******************-------------------

  static const String leadListBulkDelete = '${baseurl}/api/leads/delete';
  static const String leadListBulkAssign =
      "${baseurl}/api/lead-assigned/multiple/4ab12ff3-77c3-4bb0-a2da-d5b2600bf9b5";
  static const String leadListBulkUnAssign =
      "${baseurl}/api/lead-assigned/unassigned?userId=4ab12ff3-77c3-4bb0-a2da-d5b2600bf9b5";

  //Lead List Column List
  static const String leadListColumnList =
      '${baseurl}api/lead-fields-management/view-permissions';
  static const String leadListColumnUpdate =
      '${baseurl}/api/lead-fields-management/user-lead-fields';

  //Lead Detail View--------------
  static const String leadDetailView =
      "${baseurl}api/leads/7c8bf173-a6d4-4383-8a2d-a3c948b9c298";
  static const String leadDetailCallType =
      "${baseurl}api/lead-activity-purposes?type=Call";
  static const String leadDetailMeetingType =
      "${baseurl}api/lead-activity-purposes?type=Meeting";
  static const String leadDetailTaskType = "${baseurl}api/task-type";
  static const String leadDetailTaskStatus = "${baseurl}api/task-status/list";
  static const String leadDetailProposal = "${baseurl}/api/proposals";

  //Setting SCREEN
  static const String leadSetting =
      "https://webhopers.whsuites.com/api/lead-fields-management";
  static const String settingUserProfile =
      'https://webhopers.whsuites.com/api/auth/52fd0c63-4a9b-4047-8736-0cace72393d6';
  static const String fieldSetting =
      "https://webhopers.whsuites.com/api/lead-fields";
  static const String settingCustomFields =
      'https://webhopers.whsuites.com/api/lead-custom-fields';
  static const String settingRoles = 'https://webhopers.whsuites.com/api/roles';

  //============================================================================
  // TRASH LEADS

  static const String deleteList = '${baseurl}v1/api/leads/delete_list';

  static const String leadTypes = '${baseurl}v1/api/lead-types';

  //============================================================================

  // //Setting SCREEN
  // static const String leadSetting="https://webhopers.whsuites.com/api/lead-fields-management";
  // static const String fieldSetting="https://webhopers.whsuites.com/api/lead-fields";
  // static const String settingCustomFields='https://webhopers.whsuites.com/api/lead-custom-fields';
  //

//Lead Detail Action------
  //Action Lead
  static const String leadDetailActionLead =
      "${baseurl}/api/lead-activities/ca661553-d140-4a22-8c09-e96a2b330adf";

  //Action Service-----
  static const String leadDetailActionService =
      "${baseurl}/api/lead-activities/ca661553-d140-4a22-8c09-e96a2b330adf";

  //Lead Detail Attachment---
  static const String leadDetailAttachment =
      "${baseurl}/api/leads/lead-attachments/ca661553-d140-4a22-8c09-e96a2b330adf";

  //Activity Create call, meeting,note,reminder-------
  static const String leadDetailActivityCallCreate =
      "${baseurl}/api/lead-activities/2c165cd5-2987-4255-b4dc-0df64fef5985";

  //Lead Detail Assign History ---
  static const String leadDetailAssignHistory =
      "${baseurl}/api/leads/9e231960-6448-4beb-93a5-c0b0a834c4b4/assigned-history";

  //Lead Detail History
  static const String leadDetailHistory =
      "${baseurl}/api/lead-activities/history/8192bb2a-72d0-4958-9937-f622a948d867";

  //Lead Detail Projection
  static const String leadDetailProjection = "${baseurl}api/projection";

  //lead Detail status --

  static const String leadDetailUpdateStatus =
      "${baseurl}/api/leads/ca661553-d140-4a22-8c09-e96a2b330adf/status";

  //Currency
  static const String leadDetailCurrency = "${baseurl}/api/currencies";

  //Generate Proforma
  static const String leadDetailProforma = "${baseurl}/api/performa";

//LEAD ACTIVITY
  static const String leadActivityList =
      'https://webhopers.whsuites.com/api/lead-activities/history';
  static const String leadActivityLeadType =
      "https://webhopers.whsuites.com/api/lead-types";

  //LEAD ACTIVITY DAILY REPORTS---------

  static const String leadActivityDailySaleReports =
      "https://webhopers.whsuites.com/api/lead-activities/reports";
  static const String leadActivityNoActivities =
      "https://webhopers.whsuites.com/api/lead-activities/no-activity-reports";
  static const String leadActivityLeadReports =
      "https://webhopers.whsuites.com/api/lead-activities/reports-leadwise";
  static const String leadActivityTeamLeads =
      "https://webhopers.whsuites.com/api/dashboard/team-lead-type-count";

  // LEAD MASTER
  // TYPES
  static const String leadMastersTypes = '${baseurl}v1/api/lead-types';

  // SOURCE
  static const String leadMastersSource = '${baseurl}v1/api/lead-sources?q=';

  // STATUS
  static const String leadMastersStatus = '${baseurl}v1/api/lead-status?q=';

  //COMPANY PROFILE

  static const String companyProfile =
      'https://webhopers.whsuites.com/api/company-profile';

  //============================================================================
  //============================================================================
  // CUSTOMER
  //LIST----

  static const String customersList =
      'https://webhopers.whsuites.com/api/customers/customer-list';
  static const String customerType =
      'https://webhopers.whsuites.com/api/customer-types';
  static const String customerSource =
      'https://webhopers.whsuites.com/api/lead-sources?q=';
  static const String customerListSearchAssign =
      'https://webhopers.whsuites.com/api/auth/users-list-and-search';
  static const String customerListDivision =
      'https://webhopers.whsuites.com/api/divisions?q=';
  static const String customerMasterCompanyCredentialCreate =
      "${baseurl}/api/companies/credential-type";
  static const String customerMasterActivationSettingCreate =
      "${baseurl}/api/project-activation-settings";
  static const String customerMasterActivationSetting =
      "${baseurl}api/project-activation-settings/list";

  static const String customerMasterActivationSettingUpdate =
      "${baseurl}/api/project-activation-settings/05516662-95b7-440d-bfbb-b4ecd509da52";

  // static const String filterCity="https://webhopers.whsuites.com/api/cities/list";

  //Customer List Detail View
  static const String customerListDetailViewList =
      "${baseurl}api/customers/8d19a603-e558-40f1-ab2c-a6ab764716d3";

  //Service categories
  static const String customerListServiceCategories =
      "${baseurl}api/customers/8d19a603-e558-40f1-ab2c-a6ab764716d3/service-categories";

  //Company List
  static const String customerDetailViewCompanyList =
      "${baseurl}api/companies/list/8d19a603-e558-40f1-ab2c-a6ab764716d3";

  //Activities
  static const String customerDetailViewActivities =
      "${baseurl}api/customer-activities/history-customer-view";

  //Assign History
  static const String customerDetailViewAssignedHistory =
      "${baseurl}api/customers/c5f2b49c-e836-4a1f-8e84-61eb9cd3e9b0/assigned-history";

  //Services

  static const String customerDetailViewServices =
      "${baseurl}api/customers/c5f2b49c-e836-4a1f-8e84-61eb9cd3e9b0/services";

  //orderList
  static const String customerDetailViewOrderList =
      "${baseurl}api/customers/8d19a603-e558-40f1-ab2c-a6ab764716d3/orders";

  //payments
  static const String customerDetailViewPaymentList =
      "${baseurl}api/customers/9e47d5a5-a8f2-461d-9fdb-70a43e661d8b?option=payments";

//Projects
  static const String customerDetailViewProjects =
      "${baseurl}api/customers/5a577a41-79af-4c6c-b31b-ebd359a8a0be?option=projects";

  //Credit Debit

  static const String customerDetailViewCreditDebit =
      "${baseurl}api/customers/d7318a8e-d73a-4e61-b45a-a91bedda1a93?option=creditdebit";

  //Lead
  static const String customerDetailViewLead =
      "${baseurl}api/customers/8d19a603-e558-40f1-ab2c-a6ab764716d3?option=leads";

  //Activity Purpose call Type
  static const String customerDetailViewCallType =
      "${baseurl}api/customer-activity-purposes";

  //Create Company

  static const String customerDetailCreateCompany = "${baseurl}/api/companies";

  //Update Company Api
  static const String customerDetailUpdateCompany =
      "${baseurl}/api/companies/e09bd99f-3c6b-4013-9299-ac874b974c71";

  //ACTIVITIES---

  static const String customerActivityList =
      'https://webhopers.whsuites.com/api/customer-activities/history';
  static const String customerActivityReports =
      '${baseurl}api/customer-activities/reports-userwise';
  static const String customerActivityNoActivities =
      '${baseurl}api/customer-activities/inactive-reports';
  static const String customerActivityCustomerReports =
      '${baseurl}api/customer-activities/reports';
  static const String customerActivityUniqueMeeting = '';
  static const String customerActivityStatusReport =
      '${baseurl}api/customer-activities/customer-status';

  // PAYMENT REMINDER------
  static const String customersPaymentReminder =
      'https://webhopers.whsuites.com:3006/v1/api/customer-payment-reminders/list';

  //COMPANIES
  static const String customerCompanies =
      'https://webhopers.whsuites.com:3006/v1/api/companies/list-all';

  //SERVICES----
  static const String customerServices =
      'https://webhopers.whsuites.com:3006/v1/api/customer-services/list';

  //SERVICE AREA
  static const String safeAreaState =
      "${baseurl}api/service-areas/available/states";
  static const String safeAreaCity =
      "${baseurl}api/service-areas/available/districts";
  static const String safeAreaPincode =
      '${baseurl}api/service-areas/available/pincodes';
  static const String safeAreaProduct =
      '${baseurl}api/service-areas/available/products';
  static const String safeAreaSelectCompany =
      '${baseurl}api/companies/list-all';
  static const String safeAreaAllotProduct =
      '${baseurl}api/service-areas/create';

  // ORDER PRODUCTS
  static const String customersOrderProducts =
      '${baseurl}v1/api/order-products/list';
  static const String orderProductSearch = "${baseurl}api/products?searchTerm=";
  static const String orderProductService = "${baseurl}/api/customer-services";
  static const String orderProductQuit =
      "${baseurl}/api/customer-services/quit/a48a7b87-5be3-43a4-b2f4-6a2bbaf0b1a0";
  static const String orderProductRenew =
      "${baseurl}/api/customer-services/restart";

  //CUSTOMER ORDERLESS SERVICES
//Use dev url
  static const String orderlessServicesList =
      "$baseurl/api/orderless-services/list";
  static const String orderlessServiceCreate =
      "${baseurl}/api/orderless-services";
  static const String orderlessServiceQuit =
      "${baseurl}/api/orderless-services/a239af48-02c9-46e9-80c2-39b33d1752ee/quit";
  static const String orderlessServiceRenew =
      "${baseurl}/api/orderless-services/a239af48-02c9-46e9-80c2-39b33d1752ee/restart";

  // TRASH
  static const String customersTrashLead = '${baseurl}v1/api/customers/trash';

  // ACTIVATION LIST
  static const String customersActivationList =
      '${baseurl}v1/api/sent-project-activation/list';

  // CUSTOMER (MASTER)
  // COMPANY CREDENTIAL
  //============================================================================

  //Customer Master

  static const String customerMasterCompanyCredential =
      "${baseurl}api/companies/credential-type";
  static const String customerMasterCompanyCredentialUpdate =
      "${baseurl}/api/companies/credential-type/218fd612-2501-4ce1-b42d-6282ed8b49b3";
  static const String customerMasterCustomerType =
      "${baseurl}api/customer-types";
  static const String customerTypeCreate = "${baseurl}/api/customer-types";
  static const String customerTypeUpdate =
      "${baseurl}/api/customer-types/08531989-ac1c-469d-bb0c-2a457b0fa858";
  static const String customerMasterActivityPurpose =
      "${baseurl}api/customer-activity-purposes";
  static const String customerMasterActivityPurposeCreate =
      "${baseurl}/api/customer-activity-purposes";
  static const String customerMasterActivationServices =
      "${baseurl}api/product-categories/list";
  static const String customerMasterActivationAvailableField =
      "${baseurl}/api/project-activation-fields/list";
  static const String customerMasterActivationUpdate =
      "${baseurl}/api/project-activation-managements/create-activation/0647c740-0c84-4599-9a49-cd3c88f901b9";
  static const String customerMasterActivationField =
      "${baseurl}api/project-activation-fields/list";
  static const String customerMasterActivationFieldCreate =
      "${baseurl}/api/project-activation-fields";

  //Customer  Setting
  static const String customerSettingColumnList =
      "${baseurl}api/customer-field-management";
  static const String customerSettingColumnSaveChange =
      "${baseurl}/api/customer-field-management";
  static const String customerSettingColumnUpdate =
      "${baseurl}/api/hide-customer-columns-from-role/create";
  static const String customerSettingFieldList =
      "${baseurl}api/customer-fields";

//Customer Trash -----
  //List
  // TRASH
  static const String customersTrashList = '${baseurl}/api/customers/trash';

  // CUSTOMER (MASTER)
  // COMPANY CREDENTIAL
  //============================================================================
  static const String customersCompanyCredential =
      '${baseurl}v1/api/companies/credential-type';

  // TYPES
  static const String customersMasterTypes =
      '${baseurl}v1/api/companies/credential-type';

  // ACTIVITY PURPOSE
  static const String customerActivityPurpose =
      '${baseurl}v1/api/customer-activity-purposes';

  // ACTIVATION
  static const String customerActivation =
      '${baseurl}v1/api/product-categories/list';

  // FIELD
  static const String customerField =
      '${baseurl}v1/api/project-activation-fields/list';

  // SETTINGS
  static const String customerSettings =
      '${baseurl}v1/api/customer-field-management';

  //============================================================================
  // ORDER
  static const String orderList = '${baseurl}v1/api/orders/order-list';
  static const String orderCompany = "${baseurl}/api/companies/list-all";
  static const String orderGenerateList =
      "${baseurl}/api/orders/41d25a24-1dca-4e5a-ab9c-d22d5a76ad55/performa-invoice";
  static const String orderDetailList =
      "${baseurl}/api/orders/01ecd555-6254-488d-a2c3-5a5cdc3602fa";

  //:------- Activities
  static const String orderActivities =
      '${baseurl}v1/api/order-activity/products';

  //:-------PROFORMA
  static const String orderProforma =
      'https://webhopers.whsuites.com:3006/v1/api/performa';

  //:-------PAYMENTS
  static const String orderPayment =
      '${baseurl}v1/api/customer-payments/payment-list';

  //:-------ORDER MASTER
  static const String orderMaster = '${baseurl}v1/api/order-status';

  //============================================================================

//Reports

  // Task stop start
  static const String taskStartStop =
      'https://webhopers.whsuites.com/api/tasks/task-tracker-event';

  // static const String taskProjectOverViewList="${baseurl}api/projects/4e71cae5-a4ba-403f-aaf6-35ebb5295baf";
  static const String taskUpdate =
      "${baseurl}/api/tasks/98a676ad-23b2-4f3b-8f26-33906250c10a";
  static const String taskProjectReportList =
      "https://webhopers.whsuites.com/api/projects/project-report-list";
  static const String taskCreateReportList =
      "${baseurl}api/projects/create-project-report";
  static const String reportTaskRemoveAttachment =
      "${baseurl}/api/tasks/remove-attachment/8a7f359a-2d03-4e41-b41a-98559eaf4ac2";

// PROJECT
  // LIST
  // static const String projectList = 'https://dev.whsuites.com/api/projects/list';
  static const String projectList = 'https://webhopers.whsuites.com/api/projects/list?';

  static const String projectReminder = "${baseurl}/api/projects/create-report-reminder";



  //============================================================================
  // PRODUCT
  // LIST

  //product list--------
  // static const String productList = "https://dev.whsuites.com/api/products/list-all";
  static const String productList = "${baseurl}api/products/list-all";

  static const String productBrand = "${baseurl}/api/product-brand";
  static const String addProduct = "${baseurl}/api/products";
  static const String updateProduct = "${baseurl}/api/products/1db2ee14-aa7f-4d72-bd5a-0e27b8c7df49";

  // CATEGORY
  // static const String productCategory = 'https://dev.whsuites.com/api/product-categories?search=';
  static const String productCategory = '${baseurl}/api/product-categories?search=';

  // brand------
  static const String addProductBrand = "${baseurl}/api/product-brand";

  //Gst---------
  static const String productGstList = "${baseurl}/api/gsts?searchTerm=";

  //add gst------
  static const String productAddGst = "${baseurl}/api/gsts";

  //Master
  //Add Product-------

  static const String masterAddProduct = "${baseurl}/api/incentive-products";
  static const String masterProductList =
      "${baseurl}/api/incentive-products/list";

  // HRM
  // ATTENDANCE
  static const String hrmAttendance = '${baseurl}v1/api/holidays/list';
  static const String hrmLeaveType = '${baseurl}v1/api/hrm/leave-type';
  static const String hrmLeavePlan = '${baseurl}v1/api/hrm/leave-plan';
  static const String addLeaveType = '${baseurl}v1/api/hrm/leave-type';

  // LEAVE
  static const String hrmLeave = '${baseurl}v1/api/hrm/leave-type';

  static String updateLeaveType(String id) {
    return '${baseurl}v1/api/hrm/leave-type/$id';
  }

  // CAMPAIGN
  // LIST

  static const String campaignList = '${baseurl}v1/api/marketing-campaign/list';

  // MAIL LOGS
  static const String campaignMailLogs = '${baseurl}v1/api/mail-logs/list';

  // WHATSAPP
  static const String whatsappApi = '${baseurl}v1/api/whatsapp/chats';

  // SALES
  static const String salesApi = '${baseurl}v1/api/target-incentives/list';
  static const String saleAddTarget = "${baseurl}v1/api/target-incentives";

  static const String projectionUpdateList = '${baseurl}v1/api/projection/2c9e464b-73bd-4f0a-8084-2fdf2479f740t';


  static String salesUptProjection(String userId) {
    return '${baseurl}v1//api/projection/$userId';
  }

  static const String deleteProduct = "${baseurl}v1/api/target-incentives/remove-product-require/a99c6556-fc3e-4fa4-ae91-05d14fe79434";


  static const String addProductIncentive = "${baseurl}v1/api/target-incentives/add-product-incentive";
  static const String salesProjection = '${baseurl}v1//api/projection/list';

  static const String deleteProductIncentive = "${baseurl}v1/api/target-incentives/remove-product-incentive/251025a2-a037-499f-ac85-166fe4c29713";

  static const String incentiveBreakDownUpdate = "${baseurl}/v1api/target-incentives/add-incentive-breakdown";

  static const String saleAddProduct = "${baseurl}v1/api/target-incentives/add-product-require";
  static const String deleteBreakDownIncentive = "${baseurl}v1/api/target-incentives/remove-incentive-breakdown/f9cb6b4c-af4e-4002-adc1-5b16bb877d14";
  static const String updateProductIncentive = "${baseurl}v1/api/target-incentives/edit-product-incentive/6c2a00db-27dc-4b8d-9d51-afbf12a29b7e";
  static const String targetDetail = "${baseurl}v1/api/target-incentives/06e5fbfe-936a-45a6-82e2-5adc59628692";

  // ROLES
  static const String rolesApi = '${baseurl}v1/api/roles';

  // USERS
  static const String usersApi = '${baseurl}v1/api/auth/user-list';

  // static const String usersActivitiesApi = 'https://dev.whsuites.com/api/user-activities/list';
  static const String usersActivitiesApi = '${baseurl}v1/api/user-activities/list';


  static const String usersAddDepartment = '${baseurl}v1/api/departments';

  // static String roleEdit(String roleId) {return 'https://dev.whsuites.com/api/roles/$roleId/update';
  // }

  static String roleEdit(String roleId) {return '${baseurl}v1/api/roles/$roleId/update';
  }

  static const String roleUpdateList = '${baseurl}v1/api/modules';


  static String usersStatusApi(String userId) {
    return '${baseurl}v1/api/auth/status-change/$userId';
  }



  static String userUpdateApi(String userId) {
    return '${baseurl}v1/api/auth/update-user/$userId';
  }


  //============================================================================

  // TASKS
  // LIST
  static const String taskListApi = '${baseurl}v1/api/tasks/list';
  static const String taskList = "${baseurl}v1/api/tasks/list";

  static const String searchProject = "${baseurl}api/projects/list-and-search";

  static const String newBoard = "${baseurl}/api/task-status";
  static const String taskMasterList = "${baseurl}api/task-type";
  static const String taskMasterAddTaskType = "${baseurl}/api/task-type";
  static const String taskMasterUpdate =
      "${baseurl}/api/task-type/160dc1bb-9d7a-4996-8743-9c391756cd67";

  // REPORT
  static const String taskReport = '${baseurl}v1/api/tasks/team-task-report';

  // MASTER
  static const String taskMaster = '${baseurl}v1/api/task-type';

  //============================================================================
  // PROJECT
  // LIST
  static const String projectDetailView = "${baseurl}v1/api/projects/";

  // MASTER
  static const String projectMaster = '${baseurl}v1/api/project-tags';

  //============================================================================

  // MASTER
  static const String productMaster =
      '${baseurl}v1/api/incentive-products/list';

  //============================================================================
  // INVENTORY
  // STOCK
  static const String inventoryStock = '${baseurl}v1/api/inventories';

  // REQUEST
  static const String inventoryRequest = '${baseurl}v1/api/inventory-requests';

  // TRANSACTIONS
  static const String inventoryTransactions =
      '${baseurl}v1/api/inventory-transactions';

  // VENDORS
  static const String inventoryVendors =
      '${baseurl}v1/api/manufacturers?page=1&limit=15';

  // REFILL STOCKS
  static const String inventoryRefillStocks =
      '${baseurl}v1/api/inventory-replenishments?page=1&limit=15';

  //============================================================================
  // MASTER
  // DEPARTMENTS
  static const String masterDepartments =
      '${baseurl}v1/api/departments/search?q=';


  static const String masterAddDivision = '${baseurl}v1/api/divisions';

  static String updateDivisionList(String id) {
    return '${baseurl}api/divisions/$id';
  }


  // DIVISIONS
  static const String masterDivisions = '${baseurl}v1/api/divisions?q=';

  //PROPOSALS
  static const String masterProposals = '${baseurl}v1/api/proposals';

  //============================================================================
  // CITIES< STATES AND COUNTRY
  // CITIES
  static const String masterCities = '${baseurl}v1/api/cities/list';

  // COUNTRY
  static const String masterCountry = '${baseurl}v1/api/countries/list';

  //============================================================================
  // CUSTOMIZE LABELS
  // CUSTOMIZE
  static const String masterCustomize = '${baseurl}v1/api/module-dictionaries';
  static const String masterCustomizeList =
      'https://webhopers.whsuites.com/api/module-dictionaries';
  static const String masterCustomizeType =
      'https://webhopers.whsuites.com/api/modules/list';
  static const String masterCustomizeLeadSource =
      'https://webhopers.whsuites.com/api/module-dictionaries';
  static const String masterCustomizeOrder =
      'https://webhopers.whsuites.com/api/module-dictionaries';


  static const String masterDashboardList = 'https://dev.whsuites.com/api/roles/with-charts';
  static const String masterDashboardSaveChanges = 'https://dev.whsuites.com/api/dashboard/configure';
}
