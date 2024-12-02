import 'package:flutter/material.dart';
import '../../../../utils/appColors/app_colors.dart';

class CustomerPaymentReminderCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String cardId;
  final bool isDetailsVisible;
  final Function() onToggleDetails;

  const CustomerPaymentReminderCard({
    super.key,
    required this.data,
    required this.cardId,
    required this.isDetailsVisible,
    required this.onToggleDetails,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Ritelife Healthcare",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Price in the middle
                if (isDetailsVisible)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      data['price'] ?? '₹0', // Provide a fallback value
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AllColors.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                // Dropdown icon at the end
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tightFor(width: 32),
                  icon: Icon(
                    isDetailsVisible
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: isSmallScreen ? 20 : 24,
                  ),
                  onPressed: onToggleDetails,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Customer Info
            Row(
              children: [
                Expanded(
                  child: Text(
                    data['customerName'] ?? 'Unknown Customer', // Provide a fallback value
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      data['phone'] ?? 'N/A', // Provide a fallback value
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Product and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product: ${data['product'] ?? 'N/A'}", // Provide a fallback value
                  style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 13 : 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: (data['status'] ?? "N/A" == "Paid" ? Colors.green : Colors.orange)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    (data['status'] ?? 'N/A').toUpperCase(), // Provide a fallback value
                    style: TextStyle(
                      color: data['status'] == "Paid" ? Colors.green : Colors.orange,
                      fontSize: isSmallScreen ? 10 : 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            if (!isDetailsVisible)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8, top: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AllColors.lighterPurple,
                      ),
                      child: Text(
                        data['createdBy'] ?? 'Unknown', // Provide a fallback value
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AllColors.vividPurple,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Spacer(),
                    Text(
                      data['price'] ?? '₹0', // Provide a fallback value
                      style: TextStyle(
                        color: AllColors.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            if (isDetailsVisible) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ORDER ID",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['orderId'] ?? 'N/A', // Provide a fallback value
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "REMINDER TO",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['reminderTo'] ?? 'N/A', // Provide a fallback value
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CREATED BY",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8, top: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: AllColors.lighterPurple,
                          ),
                          child: Text(
                            data['createdBy'] ?? 'Unknown', // Provide a fallback value
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "CREATED AT",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          data['createdAt'] ?? 'N/A', // Provide a fallback value
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CHEQUE",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['cheque'] ?? 'N/A', // Provide a fallback value
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "CHEQUE/REMINDER",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          data['reminderAt'] ?? 'N/A', // Provide a fallback value
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (data['status'] != "Paid")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "DUE DATE",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['dueDate'] ?? 'N/A', // Provide a fallback value
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
