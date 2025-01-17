class UsersListResponseModel {
  UsersListResponseModel({
    required this.items,
    required this.meta,
    required this.userKey,
  });

  final List<Item> items;
  final Meta? meta;
  final String? userKey;

  factory UsersListResponseModel.fromJson(Map<String, dynamic> json){
    return UsersListResponseModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      userKey: json["user_key"],
    );
  }

}

class Item {
  Item({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.bio,
    required this.profilePic,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.rememberTokenTime,
    required this.itemDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.deviceId,
    required this.tracking,
    required this.crmCategory,
    required this.mobileApp,
    required this.superSettings,
    required this.department,
    required this.parent,
    required this.roleList,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final dynamic address;
  final dynamic bio;
  final dynamic profilePic;
  final String? password;
  final bool? status;
  final String? rememberToken;
  final DateTime? rememberTokenTime;
  final bool? itemDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deviceId;
  final bool? tracking;
  final String? crmCategory;
  final bool? mobileApp;
  final bool? superSettings;
  final Department? department;
  final Item? parent;
  final List<RoleList> roleList;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobile: json["mobile"],
      address: json["address"],
      bio: json["bio"],
      profilePic: json["profile_pic"],
      password: json["password"],
      status: json["status"],
      rememberToken: json["remember_token"],
      rememberTokenTime: DateTime.tryParse(json["remember_token_time"] ?? ""),
      itemDefault: json["default"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deviceId: json["device_id"],
      tracking: json["tracking"],
      crmCategory: json["crm_category"],
      mobileApp: json["mobile_app"],
      superSettings: json["superSettings"],
      department: json["department"] == null ? null : Department.fromJson(json["department"]),
      parent: json["parent"] == null ? null : Item.fromJson(json["parent"]),
      roleList: json["role_list"] == null ? [] : List<RoleList>.from(json["role_list"]!.map((x) => RoleList.fromJson(x))),
    );
  }

}

class Department {
  Department({
    required this.id,
    required this.name,
    required this.description,
    required this.departmentDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? description;
  final bool? departmentDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Department.fromJson(Map<String, dynamic> json){
    return Department(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      departmentDefault: json["default"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class RoleList {
  RoleList({
    required this.id,
    required this.name,
    required this.description,
    required this.roleListDefault,
  });

  final String? id;
  final String? name;
  final String? description;
  final bool? roleListDefault;

  factory RoleList.fromJson(Map<String, dynamic> json){
    return RoleList(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      roleListDefault: json["default"],
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

/*
{
	"items": [
		{
			"id": "52fd0c63-4a9b-4047-8736-0cace72393d6",
			"first_name": "Avdesh",
			"last_name": "Gupta",
			"email": "avdesh.webhopers@gmail.com",
			"mobile": "9811816991",
			"address": null,
			"bio": null,
			"profile_pic": null,
			"password": "$2a$10$AUfKy0zdnCgfR8P0pm5XTOK0AOE0s7V77vWHPsxBKIBShv7HBldiy",
			"status": true,
			"remember_token": null,
			"remember_token_time": null,
			"default": false,
			"created_at": "2023-10-31T16:34:48.301Z",
			"updated_at": "2025-01-17T05:53:20.000Z",
			"device_id": "iphone 15 pro",
			"tracking": false,
			"crm_category": "core",
			"mobile_app": true,
			"superSettings": false,
			"department": {
				"id": "af60da18-c025-49cf-9ec8-c55637506c2f",
				"name": "Development",
				"description": "Development",
				"default": false,
				"created_at": "2023-08-22T12:19:20.538Z",
				"updated_at": "2023-08-22T12:19:20.538Z"
			},
			"parent": {
				"id": "2989ad54-b395-453a-8f52-905726d1b641",
				"first_name": "Sunil",
				"last_name": "Garg",
				"email": "sunil@webhopers.com",
				"mobile": "8627009670",
				"address": null,
				"bio": null,
				"profile_pic": null,
				"password": "$2a$10$TQmQvjGqK2gakW3PPKnwguICRlPwwtuK42NSGMWLvb/axqE8or2kS",
				"status": true,
				"remember_token": null,
				"remember_token_time": null,
				"default": false,
				"created_at": "2023-08-23T09:37:30.785Z",
				"updated_at": "2025-01-16T11:59:38.000Z",
				"device_id": null,
				"tracking": false,
				"crm_category": "core",
				"mobile_app": true,
				"superSettings": false
			},
			"role_list": [
				{
					"id": "73ca4cf6-9d92-4911-a73a-b28d893f7bd1",
					"name": "Development TL",
					"description": "Development TL",
					"default": false
				}
			]
		},
		{
			"id": "3be56418-efdc-45f7-a5b6-1657dad02aee",
			"first_name": "Rishabh",
			"last_name": "Sharma",
			"email": "rishabh.webhopers@gmail.com",
			"mobile": "7743000247",
			"address": null,
			"bio": null,
			"profile_pic": null,
			"password": "ff8d0e0377d73ff91b5bf68d2913434acdc15d694384839ceb80c6f076d5d6e0",
			"status": false,
			"remember_token": "3be56418-efdc-45f7-a5b6-1657dad02aee",
			"remember_token_time": "2024-08-21T10:32:11.000Z",
			"default": false,
			"created_at": "2023-10-31T16:36:08.185Z",
			"updated_at": "2025-01-16T11:59:38.000Z",
			"device_id": "iphone 15 pro",
			"tracking": false,
			"crm_category": "core",
			"mobile_app": true,
			"superSettings": false,
			"department": {
				"id": "af60da18-c025-49cf-9ec8-c55637506c2f",
				"name": "Development",
				"description": "Development",
				"default": false,
				"created_at": "2023-08-22T12:19:20.538Z",
				"updated_at": "2023-08-22T12:19:20.538Z"
			},
			"parent": {
				"id": "52fd0c63-4a9b-4047-8736-0cace72393d6",
				"first_name": "Avdesh",
				"last_name": "Gupta",
				"email": "avdesh.webhopers@gmail.com",
				"mobile": "9811816991",
				"address": null,
				"bio": null,
				"profile_pic": null,
				"password": "$2a$10$AUfKy0zdnCgfR8P0pm5XTOK0AOE0s7V77vWHPsxBKIBShv7HBldiy",
				"status": true,
				"remember_token": null,
				"remember_token_time": null,
				"default": false,
				"created_at": "2023-10-31T16:34:48.301Z",
				"updated_at": "2025-01-17T05:53:20.000Z",
				"device_id": "iphone 15 pro",
				"tracking": false,
				"crm_category": "core",
				"mobile_app": true,
				"superSettings": false
			},
			"role_list": [
				{
					"id": "8beb7919-6ebd-4d2b-8cd4-89d84a356577",
					"name": "Development Executive",
					"description": "Development Executive",
					"default": false
				}
			]
		},
		{
			"id": "db7b374d-8097-4429-beaa-0db79203e803",
			"first_name": "Sakshi ",
			"last_name": "Chaudhary ",
			"email": "sakshich.webhopers@gmail.com",
			"mobile": "6280741896",
			"address": null,
			"bio": null,
			"profile_pic": null,
			"password": "$2a$10$MwC6/ndbVgWlyKlhERK1o.WqV1FlO.fVDhHRsIqvWf7sKhb2p2jSS",
			"status": true,
			"remember_token": "9afaf29ed40d9bb8d58bae58769838c7320a74e591ac60382cdd977c03f892ba647b55c225c63528dc2a539809a59786",
			"remember_token_time": null,
			"default": false,
			"created_at": "2024-08-22T11:50:04.473Z",
			"updated_at": "2025-01-16T11:59:39.000Z",
			"device_id": "cBqwhjV3QZetsBobkiQ6yU:APA91bHKiesZjxtCKZp1YYdYJ1xb3O4fhoTj7lfLG2AU47rH0QJNMcIdyjNxBGKnOvtlOywMjrMPoVbNVQTkYWCijeeq7ipem18QzBsmLYnEaTYyw9KZeQ8JRT7cvVvn0riZ-1SumYic",
			"tracking": false,
			"crm_category": "core",
			"mobile_app": false,
			"superSettings": false,
			"department": {
				"id": "af60da18-c025-49cf-9ec8-c55637506c2f",
				"name": "Development",
				"description": "Development",
				"default": false,
				"created_at": "2023-08-22T12:19:20.538Z",
				"updated_at": "2023-08-22T12:19:20.538Z"
			},
			"parent": {
				"id": "52fd0c63-4a9b-4047-8736-0cace72393d6",
				"first_name": "Avdesh",
				"last_name": "Gupta",
				"email": "avdesh.webhopers@gmail.com",
				"mobile": "9811816991",
				"address": null,
				"bio": null,
				"profile_pic": null,
				"password": "$2a$10$AUfKy0zdnCgfR8P0pm5XTOK0AOE0s7V77vWHPsxBKIBShv7HBldiy",
				"status": true,
				"remember_token": null,
				"remember_token_time": null,
				"default": false,
				"created_at": "2023-10-31T16:34:48.301Z",
				"updated_at": "2025-01-17T05:53:20.000Z",
				"device_id": "iphone 15 pro",
				"tracking": false,
				"crm_category": "core",
				"mobile_app": true,
				"superSettings": false
			},
			"role_list": [
				{
					"id": "8beb7919-6ebd-4d2b-8cd4-89d84a356577",
					"name": "Development Executive",
					"description": "Development Executive",
					"default": false
				}
			]
		},
		{
			"id": "dfb52b89-f6be-499b-a1fb-946b50278b62",
			"first_name": "Vivek Kumar",
			"last_name": "Rai",
			"email": "vivekrai.wh@gmail.com",
			"mobile": "6201662075",
			"address": null,
			"bio": null,
			"profile_pic": null,
			"password": "$2a$10$ic.SVF3ThuReeofsJOXqM.i1Bi4RT7IAPOu1F47HuiIS9QZG/0hzu",
			"status": true,
			"remember_token": "51b8d5be36aa61d4e77428d6a5e09b9b36427853e2f930d8df27bfd7d3b7acf58f848860786d2d1c24b659dcdd2ba7ac",
			"remember_token_time": null,
			"default": false,
			"created_at": "2024-08-21T10:38:10.548Z",
			"updated_at": "2025-01-16T11:59:39.000Z",
			"device_id": null,
			"tracking": false,
			"crm_category": "core",
			"mobile_app": false,
			"superSettings": false,
			"department": {
				"id": "af60da18-c025-49cf-9ec8-c55637506c2f",
				"name": "Development",
				"description": "Development",
				"default": false,
				"created_at": "2023-08-22T12:19:20.538Z",
				"updated_at": "2023-08-22T12:19:20.538Z"
			},
			"parent": {
				"id": "52fd0c63-4a9b-4047-8736-0cace72393d6",
				"first_name": "Avdesh",
				"last_name": "Gupta",
				"email": "avdesh.webhopers@gmail.com",
				"mobile": "9811816991",
				"address": null,
				"bio": null,
				"profile_pic": null,
				"password": "$2a$10$AUfKy0zdnCgfR8P0pm5XTOK0AOE0s7V77vWHPsxBKIBShv7HBldiy",
				"status": true,
				"remember_token": null,
				"remember_token_time": null,
				"default": false,
				"created_at": "2023-10-31T16:34:48.301Z",
				"updated_at": "2025-01-17T05:53:20.000Z",
				"device_id": "iphone 15 pro",
				"tracking": false,
				"crm_category": "core",
				"mobile_app": true,
				"superSettings": false
			},
			"role_list": [
				{
					"id": "8beb7919-6ebd-4d2b-8cd4-89d84a356577",
					"name": "Development Executive",
					"description": "Development Executive",
					"default": false
				}
			]
		}
	],
	"meta": {
		"currentPage": 1,
		"itemsPerPage": 15,
		"totalPages": 1,
		"totalItems": 4,
		"itemCount": 4
	},
	"user_key": "52fd0c63-4a9b-4047-8736-0cace72393d6"
}*/