class DashboardLeadSourceRequestModel{
String? id;
String? name;
String? status;
String? created_at;
String? update_at;
String? leads;
int? leadCount;

DashboardLeadSourceRequestModel({
  this.id,
  this.name,
  this.status,
  this.created_at,
  this.update_at,
  this.leads,
  this.leadCount,
});

Map toJson() => {
  'id': id,
  'name': name,
  'status': status,
  'created_at': created_at,
  'updated_at': update_at,
  'leads': leads,
  'leadCount': leadCount,
};}