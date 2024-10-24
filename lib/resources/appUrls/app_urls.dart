class AppUrls{

  static const String baseurl = 'https://webhopers.whsuites.com:3006/';

  //============================================================================
  // LOGIN SCREEN API

  static const String loginApi = '${baseurl}v1/api/auth/signin';

  //============================================================================
  // FORGOT PASSWORD API

  static const String forgotApi = '${baseurl}v1/api/authx/forgot-password';

  //============================================================================
  // HOME SCREEN API

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
  static const String leadList = '${baseurl}v1/api/leads/list';

  static const String leadAssign='https://webhopers.whsuites.com/api/auth/users-list-and-search';
  static const String assignedLeadTo = '${baseurl}v1/api/auth/get-descendants';

  static const String createNewLeadSource = '${baseurl}v1/api/lead-sources';

  static const String createNewLeadProductCategory='${baseurl}v1/api/product-categories/list';

  static const String createNewLeadDivisions = '${baseurl}v1/api/divisions?q=';

  static const String createNewLeadCustomFields = '${baseurl}v1/api/lead-custom-fields';
  static const String createLeadPincode='${baseurl}v1/api/city-pincodes/search?search=';
  static const String createNewLead = '${baseurl}https://webhopers.whsuites.com:3006/v1/api/leads';
  static const String  leadListTrash= '${baseurl}v1/api/leads/delete_list';

  //============================================================================
  // TRASH LEADS

  static const String deleteList = '${baseurl}v1/api/leads/delete_list';


  static const String leadType = '${baseurl}v1/api/lead-types';

  //============================================================================


  //Setting SCREEN
  static const String leadSetting="https://webhopers.whsuites.com/api/lead-fields-management";
  static const String fieldSetting="https://webhopers.whsuites.com/api/lead-fields";
  static const String settingCustomFields='https://webhopers.whsuites.com/api/lead-custom-fields';



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

  // COMPANIES
  static const String customersCompanies = '${baseurl}v1/api/companies/list-all';

  // SERVICES
  static const String customersServices = '${baseurl}v1/api/customer-services/list';

  // ORDER PRODUCTS
  static const String customersOrderProducts = '${baseurl}v1/api/order-products/list';

  // TRASH
  static const String customersTrashLead = '${baseurl}v1/api/customers/trash';

  // ACTIVATION LIST
  static const String customersActivationList = '${baseurl}v1/api/sent-project-activation/list';

  // CUSTOMER (MASTER)
  // COMPANY CREDENTIAL
  //============================================================================
  static const String customersCompanyCredential = '${baseurl}v1/api/companies/credential-type';

  // TYPES
  static const String customersMasterTypes = '${baseurl}v1/api/companies/credential-type';

  // ACTIVITY PURPOSE
  static const String customerActivityPurpose = '${baseurl}v1/api/customer-activity-purposes';

  // ACTIVATION
  static const String customerActivation = '${baseurl}v1/api/product-categories/list';

  // FIELD
  static const String customerField = '${baseurl}v1/api/project-activation-fields/list';

  // SETTINGS
  static const String customerSettings = '${baseurl}v1/api/customer-field-management';

  //============================================================================
  // ORDER
  static const String orderList = '${baseurl}v1/api/orders/order-list';

  // PROFORMA
  static const String orderProforma = '${baseurl}v1/api/performa';

  // PAYMENTS
  static const String orderPayments = '${baseurl}v1/api/customer-payments/payment-list';

  // ORDER MASTER
  static const String orderMaster = '${baseurl}v1/api/order-status';

  //============================================================================

  // HRM
  // ATTENDANCE
  static const String hrmAttendance = '${baseurl}v1/api/holidays/list';

  // LEAVE
  static const String hrmLeave = '${baseurl}v1/api/hrm/leave-type';

  // CAMPAIGN
  // LIST

  static const String campaignList = '${baseurl}v1/api/marketing-campaign/list';

  // MAIL LOGS
  static const String campaignMailLogs = '${baseurl}v1/api/mail-logs/list';

  // WHATSAPP
  static const String whatsappApi = '${baseurl}v1/api/whatsapp/chats';

  // SALES
  static const String salesApi = '${baseurl}v1/api/target-incentives/list';

  // ROLES
  static const String rolesApi = '${baseurl}v1/api/roles';

  // USERS
  static const String usersApi = '${baseurl}v1/api/auth/user-list';

  //============================================================================

  // TASKS
  // LIST
  static const String taskListApi = '${baseurl}v1/api/tasks/list';

  // REPORT
  static const String taskReport = '${baseurl}v1/api/tasks/team-task-report';

  // MASTER
  static const String taskMaster = '${baseurl}v1/api/task-type';

  //============================================================================
  // PROJECT
  // LIST
  static const String projectList = '${baseurl}v1/api/projects/list';

  // MASTER
  static const String projectMaster = '${baseurl}v1/api/project-tags';

  //============================================================================
  // PRODUCT
  // LIST

  static const String productList = '${baseurl}v1/api/product-categories?search=';

  // CATEGORY
  static const String productCategory = '${baseurl}v1/api/product-categories?search=';

  // BRAND
  static const String productBrand = '${baseurl}v1/api/product-brand';

  // GST LIST
  static const String productGstList = '${baseurl}v1/api/gsts?searchTerm=';

  // MASTER
  static const String productMaster = '${baseurl}v1/api/incentive-products/list';

  //============================================================================
  // INVENTORY
  // STOCK
  static const String inventoryStock = '${baseurl}v1/api/inventories';

  // REQUEST
  static const String inventoryRequest = '${baseurl}v1/api/inventory-requests';

  // TRANSACTIONS
  static const String inventoryTransactions = '${baseurl}v1/api/inventory-transactions';

  // VENDORS
  static const String inventoryVendors = '${baseurl}v1/api/manufacturers?page=1&limit=15';

  // REFILL STOCKS
  static const String inventoryRefillStocks = '${baseurl}v1/api/inventory-replenishments?page=1&limit=15';

  //============================================================================
  // MASTER
  // DEPARTMENTS
  static const String masterDepartments = '${baseurl}v1/api/departments/search?q=';

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
  static const String masterCustomizeList='https://webhopers.whsuites.com/api/module-dictionaries';
  static const String masterCustomizeType='https://webhopers.whsuites.com/api/modules/list';
  static const String masterCustomizeLeadSource='https://webhopers.whsuites.com/api/module-dictionaries';
  static const String masterCustomizeOrder='https://webhopers.whsuites.com/api/module-dictionaries';










}