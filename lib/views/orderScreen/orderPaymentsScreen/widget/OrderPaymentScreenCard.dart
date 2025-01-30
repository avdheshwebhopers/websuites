import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;

import '../../../../utils/appColors/app_colors.dart';
import '../../../../utils/components/widgets/sizedBoxes/sizedBox_5w.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:permission_handler/permission_handler.dart';

class OrderPaymentScreenCard extends StatefulWidget {
  final String title;
  final String paid;
  final String name;
  final String payment;
  final String uploadDocument;
  final String productRenewal;
  final String paymentMode;
  final String paidOn;
  final String product;
  final String orderId;
  final String paidProduct;
  final String createdBy;
  final String division;
  final String amount;

  const OrderPaymentScreenCard({
    Key? key,
    required this.title,
    required this.paid,
    required this.name,
    required this.payment,
    required this.uploadDocument,
    required this.productRenewal,
    required this.paymentMode,
    required this.paidOn,
    required this.product,
    required this.orderId,
    required this.paidProduct,
    required this.createdBy,
    required this.division,
    required this.amount,
  }) : super(key: key);

  @override
  State<OrderPaymentScreenCard> createState() => _OrderPaymentScreenCardState();
}

class _OrderPaymentScreenCardState extends State<OrderPaymentScreenCard> {
  // New variable to track dropdown state
  bool _isExpanded = false;

  static const Map<String, String> _divisionLogos = {
    'pharmahopers': 'assets/images/pharmahoperslogo-first-logo.png',
    'webhopers infotech private limited':
        'assets/images/webhopers-first-logo.png',
    'development': 'assets/images/development-first-logo.png',
    'seo': 'assets/images/seo.png',
    'ppc': 'assets/images/ppc.png',
    'webhopers': 'assets/images/webhopers-first-logo.png',
    'wordpress': 'assets/images/wordpress-first-logo.png',
  };

  // Method to get logos for multiple divisions
  List<Widget> _getDivisionLogos(String divisionsString) {
    // Split divisions and trim whitespace
    List<String> divisions = divisionsString
        .toLowerCase()
        .split(',')
        .map((div) => div.trim())
        .toList();

    List<Widget> logos = [];

    for (var division in divisions) {
      // Check if logo exists for the division
      if (_divisionLogos.containsKey(division)) {
        logos.add(
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Image.asset(
              _divisionLogos[division]!,
              height: division == 'pharmahopers' ? 18 : 20,
              width: division == 'webhopers infotech private limited' ? 20 : 30,
              fit: BoxFit.contain,
            ),
          ),
        );
      }
    }

    return logos;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> divisionLogos = _getDivisionLogos(widget.division);

    return
      Container(
      width: Get.width / 1,
      decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AllColors.blackColor.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 4,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3, // Give the title more space
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          // Truncate with ellipsis if needed
                          maxLines: 1, // Restrict to a single line
                        ),
                      ),
                      Spacer(flex: 1),
                      // Add space between title and other widgets

                      Container(
                        height: Get.height / 40,
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: widget.paid.toLowerCase() == 'pending'
                              ? AllColors
                                  .lightYellow // Yellow background for pending
                              : AllColors.greenJungleLight,
                          // Green background for other statuses
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.paid,
                              style: TextStyle(
                                color: widget.paid.toLowerCase() == 'pending'
                                    ? AllColors
                                        .darkYellow // Yellow text for pending
                                    : AllColors.greenJungle,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // Add dropdown for pending status
                            if (widget.paid.toLowerCase() == 'pending') ...[
                              SizedBox(width: 5),
                              Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Create a RenderBox to get the position of the current widget
                                      final RenderBox button = context
                                          .findRenderObject() as RenderBox;
                                      final RenderBox overlay =
                                          Overlay.of(context)
                                              .context
                                              .findRenderObject() as RenderBox;

                                      final RelativeRect position =
                                          RelativeRect.fromRect(
                                              Rect.fromPoints(
                                                  button.localToGlobal(
                                                      Offset.zero,
                                                      ancestor: overlay),
                                                  button.localToGlobal(
                                                      button.size.bottomRight(
                                                          Offset.zero),
                                                      ancestor: overlay)),
                                              Offset.zero & overlay.size);

                                      // Show dropdown menu
                                      showMenu(
                                        color: Colors.white,
                                        context: context,
                                        position: position,
                                        items: [
                                          PopupMenuItem(
                                            value: 'approved',
                                            child: Text('Approved'),
                                            onTap: () {
                                              // TODO: Implement approve logic
                                              // You might want to update the state or call a method to change status
                                            },
                                          ),
                                          PopupMenuItem(
                                            value: 'pending',
                                            child: Text('Pending'),
                                            onTap: () {
                                              // Already in pending state
                                            },
                                          ),
                                          PopupMenuItem(
                                            value: 'cancel',
                                            child: Text('Cancel'),
                                            onTap: () {
                                              // Show confirmation dialog
                                              Future.delayed(Duration.zero, () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Cancel Order'),
                                                      content: Text(
                                                          'Are you sure you want to cancel this order?'),
                                                      actions: [
                                                        TextButton(
                                                          child: Text('No'),
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
                                                        ),
                                                        TextButton(
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            // TODO: Add actual cancel order logic
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20,
                                      color: AllColors.darkYellow,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),

                      Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_sharp,
                        size: 30,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: AllColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/svg/fresh.png',
                            height: 14,
                            width: 14,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            widget.payment,
                            style: TextStyle(
                                color: AllColors.mediumPurple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),

                  // Show Pharmahopers container when collapsed
                  if (!_isExpanded) ...[
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Aligns the entire row to the top
                      children: [
                        // Multiple Division Logos wrapped for proper alignment
                        Wrap(
                          spacing: 4.0,
                          // Adds spacing between logos
                          runSpacing: 4.0,
                          // Adds spacing between lines if they wrap
                          children: divisionLogos,
                        ),

                        Spacer(), // Push the amount to the far end
                        Text(
                          widget.amount,
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Dropdown Content (Shown only when expanded)
          if (_isExpanded) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/menuRemark.png',
                        height: 14,
                        width: 13,
                      ),
                      SizedBox(width: 11),
                      Expanded(
                        // Wrap the Text widget with Expanded for proper truncation
                        child: Text(
                          widget.productRenewal,
                          style: TextStyle(
                            color: AllColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          // Truncate with ellipsis
                          maxLines: 1, // Restrict to a single line
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: widget.paymentMode.toLowerCase() == 'online' &&
                                widget.uploadDocument.isNotEmpty
                            ? () async {
                                // Request storage permission
                                var status = await Permission.storage.request();

                                if (status.isGranted) {
                                  try {
                                    // Show loading indicator
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );

                                    // Download image using http
                                    final response = await http.get(
                                      Uri.parse(widget.uploadDocument),
                                      // Add headers if required by your API
                                      headers: {
                                        // Example: 'Authorization': 'Bearer your_token_here',
                                        // 'Content-Type': 'application/json',
                                      },
                                    );

                                    // Check if the request was successful
                                    if (response.statusCode == 200) {
                                      // Save image to gallery
                                      final result =
                                          await ImageGallerySaver.saveImage(
                                              Uint8List.fromList(
                                                  response.bodyBytes),
                                              quality: 100,
                                              name:
                                                  "OrderDocument_${DateTime.now().millisecondsSinceEpoch}");

                                      // Close loading dialog
                                      Navigator.of(context).pop();

                                      // Show success snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Document downloaded successfully'),
                                        backgroundColor: Colors.green,
                                      ));
                                    } else {
                                      // Close loading dialog
                                      Navigator.of(context).pop();

                                      // Show error snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Failed to download document. Status code: ${response.statusCode}'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } catch (e) {
                                    // Close loading dialog
                                    Navigator.of(context).pop();

                                    // Show error snackbar
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Failed to download document: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                } else {
                                  // Show permission denied message
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Storage permission is required to download'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              }
                            : null, // Disable onTap for other values
                        child: widget.paymentMode.toLowerCase() == 'online' &&
                                widget.uploadDocument.isNotEmpty
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Doc',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue, // Doc text color
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  // Spacing between text and icon
                                  Image.asset(
                                    'assets/icons/document.png',
                                    height: 15,
                                    width: 15,
                                  ),
                                ],
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue.withOpacity(0.1),
                                ),
                                child: Text(
                                  widget.paymentMode,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16,
                        color: AllColors.mediumPurple,
                      ),
                      SizedBox5w(),
                      Text(
                        widget.paidOn,
                        style: TextStyle(
                            color: AllColors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        widget.product,
                        style: TextStyle(
                            color: AllColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Order Id',
                        style: TextStyle(
                          color: AllColors.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.orderId,
                        style: TextStyle(
                          color: AllColors.lightGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: Get.width *
                              0.3, // Set a maximum width for the container
                        ),
                        height: Get.height / 40,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AllColors.lightRed,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            widget.paidProduct,
                            maxLines: 1,
                            // Ensure the text stays in a single line
                            overflow: TextOverflow.ellipsis,
                            // Add ellipsis if the text overflows
                            style: TextStyle(
                              color: AllColors.vividRed,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AllColors.lighterPurple,
                    ),
                    child: Text(
                      widget.createdBy,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AllColors.vividPurple,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Divider(thickness: 0.4),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 0),
                        // Add your desired margin here
                        child: Row(
                          children: divisionLogos,
                        ),
                      ),
                      Spacer(),
                      Text(
                        widget.amount,
                        style: TextStyle(
                          color: AllColors.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
          ]
        ],
      ),
    );
  }
}
