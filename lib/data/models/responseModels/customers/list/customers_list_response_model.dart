class CustomersListResponseModel {
  CustomersListResponseModel({
    required this.items,
    required this.meta,
    required this.userKey,
  });

  final List<Item> items;
  final Meta? meta;
  final dynamic userKey;

  factory CustomersListResponseModel.fromJson(Map<String, dynamic> json){
    return CustomersListResponseModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      userKey: json["user_key"],
    );
  }

}

class Item {
  Item({
    required this.serviceStatus,
    required this.projectStatus,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.primaryEmail,
    required this.countryCode,
    required this.primaryContact,
    required this.organization,
    required this.createdAt,
    required this.status,
    required this.customerAssigned,
    required this.city,
    required this.state,
    required this.country,
    required this.divisions,
    required this.companies,
    required this.orders,
    required this.projects,
  });

  final String? serviceStatus;
  final dynamic? projectStatus;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? primaryEmail;
  final int? countryCode;
  final String? primaryContact;
  final String? organization;
  final DateTime? createdAt;
  final String? status;
  final List<CustomerAssigned> customerAssigned;
  final City? city;
  final City? state;
  final City? country;
  final List<City> divisions;
  final List<Company> companies;
  final List<Order> orders;
  final List<Project> projects;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      serviceStatus: json["serviceStatus"],
      projectStatus: json["projectStatus"],
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      primaryEmail: json["primary_email"],
      countryCode: json["country_code"],
      primaryContact: json["primary_contact"],
      organization: json["organization"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      status: json["status"],
      customerAssigned: json["customer_assigned"] == null ? [] : List<CustomerAssigned>.from(json["customer_assigned"]!.map((x) => CustomerAssigned.fromJson(x))),
      city: json["city"] == null ? null : City.fromJson(json["city"]),
      state: json["state"] == null ? null : City.fromJson(json["state"]),
      country: json["country"] == null ? null : City.fromJson(json["country"]),
      divisions: json["divisions"] == null ? [] : List<City>.from(json["divisions"]!.map((x) => City.fromJson(x))),
      companies: json["companies"] == null ? [] : List<Company>.from(json["companies"]!.map((x) => Company.fromJson(x))),
      orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
      projects: json["projects"] == null ? [] : List<Project>.from(json["projects"]!.map((x) => Project.fromJson(x))),
    );
  }

}

class City {
  City({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      id: json["id"],
      name: json["name"],
    );
  }

}

class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.companyEmail,
  });

  final String? id;
  final String? companyName;
  final String? companyEmail;

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      id: json["id"],
      companyName: json["company_name"],
      companyEmail: json["company_email"],
    );
  }

}

class CustomerAssigned {
  CustomerAssigned({
    required this.id,
    required this.user,
  });

  final String? id;
  final User? user;

  factory CustomerAssigned.fromJson(Map<String, dynamic> json){
    return CustomerAssigned(
      id: json["id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String? id;
  final String? firstName;
  final String? lastName;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
    );
  }

}

class Order {
  Order({
    required this.id,
    required this.orderProducts,
  });

  final String? id;
  final List<OrderProduct> orderProducts;

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      id: json["id"],
      orderProducts: json["order_products"] == null ? [] : List<OrderProduct>.from(json["order_products"]!.map((x) => OrderProduct.fromJson(x))),
    );
  }

}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.services,
  });

  final String? id;
  final List<Service> services;

  factory OrderProduct.fromJson(Map<String, dynamic> json){
    return OrderProduct(
      id: json["id"],
      services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
    );
  }

}

class Service {
  Service({
    required this.id,
    required this.status,
  });

  final String? id;
  final bool? status;

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      id: json["id"],
      status: json["status"],
    );
  }

}

class ProjectStatusClass {
  ProjectStatusClass({
    required this.inProgress,
    required this.notStarted,
    required this.finished,
  });

  final int? inProgress;
  final int? notStarted;
  final int? finished;

  factory ProjectStatusClass.fromJson(Map<String, dynamic> json){
    return ProjectStatusClass(
      inProgress: json["In Progress"],
      notStarted: json["Not Started"],
      finished: json["Finished"],
    );
  }

}

class Project {
  Project({
    required this.id,
    required this.status,
  });

  final String? id;
  final String? status;

  factory Project.fromJson(Map<String, dynamic> json){
    return Project(
      id: json["id"],
      status: json["status"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemCount,
  });

  final int? currentPage;
  final int? itemsPerPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemCount;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["currentPage"],
      itemsPerPage: json["itemsPerPage"],
      totalPages: json["totalPages"],
      totalItems: json["totalItems"],
      itemCount: json["itemCount"],
    );
  }

}
