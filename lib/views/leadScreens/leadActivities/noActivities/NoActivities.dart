import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import '../../../../data/models/responseModels/leads/lead_activity/no_activities/no_activities.dart';
import '../../../../viewModels/leadScreens/lead_activity/no_activities/no_activities.dart';

class NoActivitiesScreen extends StatefulWidget {
  final LeadActivityNoActivityViewModel leadActivityView;
  const NoActivitiesScreen({Key? key, required this.leadActivityView}) : super(key: key);

  @override
  State<NoActivitiesScreen> createState() => _NoActivitiesState();
}

class _NoActivitiesState extends State<NoActivitiesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.leadActivityView.fetchNoActivities(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.leadActivityView.loading.value && widget.leadActivityView.items.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading activities...'),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () => widget.leadActivityView.fetchNoActivities(context),
        child: widget.leadActivityView.items.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.hourglass_empty, size: 48, color: Colors.grey),
              SizedBox(height: 16),
              Text('No activities found'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => widget.leadActivityView.fetchNoActivities(context),
                child: Text('Retry'),
              ),
            ],
          ),
        )
            : ListView.builder(
          itemCount: widget.leadActivityView.items.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = widget.leadActivityView.items[index];
            String daysSinceLastCall;

            if (item.lastCall?.createdAt == null) {
              daysSinceLastCall = 'Not available';
            } else {
              try {
                final DateTime createdAt = DateTime.parse(item.lastCall!.createdAt!);
                final Duration difference = DateTime.now().difference(createdAt);
                daysSinceLastCall = '${difference.inDays} days ago';
              } catch (e) {
                print('Error parsing date: ${item.lastCall?.createdAt} - ${e.toString()}');
                daysSinceLastCall = 'Date error';
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Section
                      Text(
                        '${item.firstName ?? ''} ${item.lastName ?? ''}'.trim().isEmpty
                            ? (item.mobile ?? item.email ?? 'Not Available')
                            : '${item.firstName ?? ''} ${item.lastName ?? ''}'.trim(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 12),

                      // Contact Info
                      Row(
                        children: [
                          Icon(Icons.email_outlined, color: Colors.grey, size: 14),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              item.email ?? 'Not Available',
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.phone_in_talk_outlined, color: Colors.grey, size: 14),
                          SizedBox(width: 5),
                          Text(
                            item.mobile != null ? '+91 ${item.mobile}' : 'Not Available',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),

                      // Last Call Section
                      Text(
                        "Last Call",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(Icons.error, color: Colors.green, size: 14),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              item.lastCall?.remark ?? 'Not Available',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            height: Get.height / 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                item.lastCall?.createdBy?.firstName ?? 'Not Available',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            height: Get.height / 40,
                            decoration: BoxDecoration(
                              color: AllColors.background_green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month, color: Colors.green, size: 12),
                                SizedBox(width: 8),
                                Text(
                                  daysSinceLastCall,
                                  style: TextStyle(color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Last Meeting Section
                      Text(
                        "Last Meeting",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(Icons.error, color: Colors.green, size: 14),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              item.lastMeeting ?? 'Not Available',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            height: Get.height / 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                item.lastCall?.createdBy != null
                                    ? '${item.lastCall!.createdBy!.firstName} ${item.lastCall!.createdBy!.lastName}'
                                    : 'Not Available',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            height: Get.height / 40,
                            decoration: BoxDecoration(
                              color: AllColors.background_green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month, color: Colors.green, size: 12),
                                SizedBox(width: 8),
                                Text(
                                  daysSinceLastCall,
                                  style: TextStyle(color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}