
import 'package:flutter/material.dart';
import '../../../../app_colors/app_colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return
      Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          minTileHeight: 45,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 10),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20,),
          title: Text(
            widget.title,
            style: TextStyle(
              color: AllColors.welcomeColor,
                
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          leading: Image.asset(widget.leadingIconImage),
          children: widget.children,
          initiallyExpanded: widget.initiallyExpanded,
          onExpansionChanged: widget.onExpansionChanged,
        ),
      );
  }
}

