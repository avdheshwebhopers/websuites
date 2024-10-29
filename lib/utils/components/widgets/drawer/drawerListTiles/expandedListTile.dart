import 'package:flutter/material.dart';
import '../../../../appColors/app_colors.dart';

// Track selected items globally
class SelectedMenuItems {
  static String? selectedParent;
  static String? selectedChild;
}

class CustomExpandedListTile extends StatefulWidget {
  final String title;
  final String leadingIconImage;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const CustomExpandedListTile({
    Key? key,
    required this.title,
    required this.leadingIconImage,
    required this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  State<CustomExpandedListTile> createState() => _CustomExpandedListTileState();
}

class _CustomExpandedListTileState extends State<CustomExpandedListTile> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = SelectedMenuItems.selectedParent == widget.title;

    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        minTileHeight: 45,
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 10,
          color: isSelected ? AllColors.mediumPurple : AllColors.welcomeColor,
        ),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          widget.title,
          style: TextStyle(
            color: isSelected ? AllColors.mediumPurple : AllColors.welcomeColor,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        leading: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? AllColors.mediumPurple : AllColors.welcomeColor,
            BlendMode.srcIn,
          ),
          child: Image.asset(widget.leadingIconImage),
        ),
        initiallyExpanded: widget.initiallyExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
            if (expanded) {
              SelectedMenuItems.selectedParent = widget.title;
            }
          });
          if (widget.onExpansionChanged != null) {
            widget.onExpansionChanged!(expanded);
          }
        },
        children: widget.children.map((child) {
          if (child is ListTile) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      SelectedMenuItems.selectedParent = widget.title;
                      SelectedMenuItems.selectedChild =
                          (child.title as Text).data;
                    });
                    if (child.onTap != null) {
                      child.onTap!();
                    }
                  },
                  title: Text(
                    (child.title as Text).data!,
                    style: TextStyle(
                      color: SelectedMenuItems.selectedChild ==
                              (child.title as Text).data
                          ? AllColors.mediumPurple
                          : AllColors.welcomeColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ),
                // Add minimal space between each ListTile
                const SizedBox(height: 2),
              ],
            );
          }
          return child;
        }).toList(),
      ),
    );
  }
}
