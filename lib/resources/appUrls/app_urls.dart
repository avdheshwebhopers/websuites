class AppUrls{

  static const String baseurl = 'https://webhopers.whsuites.com:3006/';

  //============================================================================
// LOGIN SCREEN API

  static const String loginApi = '${baseurl}v1/api/auth/signin';

  //============================================================================
  // FORGOT PASSWORD API

  static const String forgotApi = '${baseurl}v1/api/auth/forgot-password';

  //============================================================================
  //HOME SCREEN API

  static const String getDashboardCountApi = '${baseurl}v1/api/dashboard/dashboard-count';

  static const String dashboard = '${baseurl}v1/api/dashboard';

  static const String userListApi = '${baseurl}v1/api/auth/userlist';

  static const String dashLeadsByTypeCount = '${baseurl}v1/api/dashboard/leads-by-type-count';

  static const String dashLeadSource = '${baseurl}v1/api/dashboard/leads-by-source-count';

  static const String dashLeadsList = '${baseurl}v1/api/leads/list';

  static const String dashLatestCustomers = '${baseurl}v1/api/customers/list';

  static const String dashLatestTask = '${baseurl}v1/api/tasks/list';

  static const String dashTransactions = '${baseurl}v1/api/customer-payments/list';

  //============================================================================
  // LEAD SCREEN API
  // CREATE NEW LEAD API

  static const String assignedLeadTo = '${baseurl}v1/api/auth/get-descendants';

  static const String createNewLeadSource = '${baseurl}v1/api/lead-sources?q=';

  static const String createNewLeadDivisions = '${baseurl}v1/api/divisions?q=';

  static const String createNewLeadCustomFields = '${baseurl}v1/api/lead-custom-fields';

  //============================================================================
  // TRASH LEADS

  static const String deleteList = '${baseurl}v1/api/leads/delete_list';

  static const String leadType = '${baseurl}v1/api/lead-types';

  //============================================================================
  // LEAD MASTER

  // TYPES
  static const String leadMastersTypes = '${baseurl}v1/api/lead-types';
  // SOURCE
  static const String leadMastersSource = '${baseurl}v1/api/lead-sources?q=';
  // STATUS
  static const String leadMastersStatus = '${baseurl}v1/api/lead-status?q=';

  //============================================================================
// CUSTOMER

//LIST
  static const String customersList = '${baseurl}v1/api/customers/customer-list';

  //ACTIVITIES
  static const String customersActivities = '${baseurl}v1/api/customer-activities/history';

  // PAYMENT REMINDER
  static const String customersPaymentReminder = '${baseurl}v1/api/customer-payment-reminders/list';
























}