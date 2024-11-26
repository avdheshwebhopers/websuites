import 'package:flutter/material.dart';

class LeadActivityCard extends StatelessWidget {
  final LeadActivitiesCard lead;

  const LeadActivityCard({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Split the email directly in the build method
    List<String> emailParts = [];
    if (lead.email.isNotEmpty) {
      int midPoint = (lead.email.length / 2).round();
      emailParts = [
        lead.email.substring(0, midPoint),
        lead.email.substring(midPoint),
      ];
    } else {
      emailParts = ['Not Available'];
    }

    // Create a string for email, joining the parts or using "Not Available"
    String emailDisplay = emailParts.isNotEmpty ? emailParts.join('') : 'Not Available';

    return Card(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7), // Static margin
      child: Padding(
        padding: EdgeInsets.all(15), // Static padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lead.name,
              style: TextStyle(
                fontSize: 16, // Static font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10), // Static spacing
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns the icon with the top line of email
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(Icons.email_outlined, color: Colors.grey, size: 14),
                ), // Email icon
                SizedBox(width: 10), // Spacing between icon and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        emailDisplay,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 2, // Allow up to 2 lines for the email
                        overflow: TextOverflow.ellipsis, // Truncate if too long
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Spacing before phone icon
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(Icons.phone, color: Colors.grey, size: 14),
                ), // Phone icon
                SizedBox(width: 10), // Spacing between icon and phone number
                Text(
                  lead.phoneNumber.isNotEmpty ? lead.phoneNumber : 'Not Available',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Static spacing
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 10), // Static spacing
            _buildStatisticsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Calls',
              style: TextStyle(
                fontSize: 15, // Static font size
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Meeting',
              style: TextStyle(
                fontSize: 15, // Static font size
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Static spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ${lead.total}',
              style: TextStyle(
                fontSize: 14, // Static font size
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Totals: ${lead.totals}',
              style: TextStyle(
                fontSize: 14, // Static font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Static spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Not Answered: ${lead.notAnsweredCalls}',
              style: TextStyle(
                fontSize: 14, // Static font size color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Physical: ${lead.physicalMeetings}',
              style: TextStyle(
                fontSize: 14, // Static font size
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LeadActivitiesCard {
  final String name;
  final String email;
  final String phoneNumber;
  final int calls;
  final int total;
  final int notAnsweredCalls;
  final int meetings;
  final int totals;
  final int physicalMeetings;

  LeadActivitiesCard({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.calls,
    required this.total,
    required this.notAnsweredCalls,
    required this.meetings,
    required this.totals,
    required this.physicalMeetings,
  });
}