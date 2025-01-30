import 'package:flutter/material.dart';
import 'package:websuites/utils/appColors/app_colors.dart';

class PaginationOptions {
  static const List<String> dropdownOptions = ['2', '5', '10', '15', '30', '50', '100', '200', '400'];
}

class PaginationDropdownWidget extends StatefulWidget {
  // Configuration parameters
  final int maxNumber;
  final int initialValue;
  final String initialDropdownValue;

  // Styling parameters
  final Color? selectedPageColor;
  final Color? unselectedPageColor;
  final Color? selectedPageTextColor;
  final Color? unselectedPageTextColor;
  final Color? dropdownBorderColor;
  final BorderRadius? dropdownBorderRadius;
  final Color? dropdownTextColor;
  final TextStyle? dropdownTextStyle;


  final Function(int)? onPageChanged;
  final Function(String)? onDropdownChanged;

  const PaginationDropdownWidget({
    Key? key,
    this.maxNumber = 100,
    this.initialValue = 1,
    this.initialDropdownValue = '2',

    // Styling parameters
    this.selectedPageColor,
    this.unselectedPageColor,
    this.selectedPageTextColor,
    this.unselectedPageTextColor,
    this.dropdownBorderColor,
    this.dropdownBorderRadius,
    this.dropdownTextColor,
    this.dropdownTextStyle,

    // Callback functions
    this.onPageChanged,
    this.onDropdownChanged,
  }) : super(key: key);

  @override
  _PaginationDropdownWidgetState createState() => _PaginationDropdownWidgetState();
}

class _PaginationDropdownWidgetState extends State<PaginationDropdownWidget> {
  late int selectedValue;
  late int startNumber;
  late int endNumber;
  late String dropdownValue;
  bool isDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    startNumber = 1;
    endNumber = widget.maxNumber > 3 ? 3 : widget.maxNumber;
    dropdownValue = widget.initialDropdownValue;
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    super.dispose();
  }

  void _handlePageChange(int newPage) {
    setState(() {
      selectedValue = newPage;

      // Adjust the window if selected number is at the edges
      if (newPage == endNumber && newPage < widget.maxNumber) {
        startNumber++;
        endNumber++;
      } else if (newPage == startNumber && newPage > 1) {
        startNumber--;
        endNumber--;
      }

      // Ensure that the end number does not exceed the max number
      if (endNumber > widget.maxNumber) {
        endNumber = widget.maxNumber;
      }
    });

    // Call the onPageChanged callback if provided
    widget.onPageChanged?.call(newPage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Backward button
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: selectedValue == 1
                  ? Colors.grey
                  : (widget.unselectedPageTextColor ?? Colors.black),
              size: 12,
            ),
            onPressed: selectedValue == 1
                ? null
                : () {
              if (selectedValue > 1) {
                _handlePageChange(selectedValue - 1);
              }
            },
          ),

          // Space between backward button and page numbers
          SizedBox(width: 8), // Adjust the width as per the required space

          // Page numbers
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Page numbers
                  for (int i = startNumber; i <= endNumber; i++) ...[
                    GestureDetector(
                      onTap: () => _handlePageChange(i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 7),
                        decoration: BoxDecoration(
                          color: selectedValue == i
                              ? (widget.selectedPageColor ?? Colors.white)
                              : (widget.unselectedPageColor ?? Colors.transparent),
                          borderRadius: BorderRadius.circular(5),
                          border: selectedValue == i
                              ? Border.all(color: AllColors.borderLine, width: 2)
                              : null,
                        ),
                        child: Text(
                          i.toString(),
                          style: TextStyle(
                            color: selectedValue == i
                                ? (widget.selectedPageTextColor ?? Colors.black)
                                : (widget.unselectedPageTextColor ?? Colors.black),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    // Add space between page numbers
                    if (i < endNumber) SizedBox(width: 10),
                  ],

                  // Forward ellipsis
                  if (endNumber < widget.maxNumber)
                    GestureDetector(
                      onTap: () => _handlePageChange(endNumber + 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 7),
                        child: const Text('...', style: TextStyle(color: Colors.black, fontSize: 12)),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Space between page numbers and forward button
          SizedBox(width: 8), // Adjust the width as per the required space

          // Forward button
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: selectedValue == widget.maxNumber
                  ? Colors.grey
                  : (widget.unselectedPageTextColor ?? Colors.black),
              size: 12,
            ),
            onPressed: selectedValue == widget.maxNumber
                ? null
                : () {
              if (selectedValue < widget.maxNumber) {
                _handlePageChange(selectedValue + 1);
              }
            },
          ),

          // Space between forward button and dropdown
          SizedBox(width: 8), // Adjust the width as per the required space

          // Dropdown
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: () {
                if (isDropdownOpen) {
                  if (_overlayEntry != null) {
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  }
                  setState(() {
                    isDropdownOpen = false;
                  });
                } else {
                  if (_overlayEntry != null) {
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  }

                  _overlayEntry = OverlayEntry(
                    builder: (context) => Positioned(
                      width: 80,
                      child: CompositedTransformFollower(
                        link: _layerLink,
                        targetAnchor: Alignment.topCenter,
                        followerAnchor: Alignment.bottomCenter,
                        offset: const Offset(0, 5),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: PaginationOptions.dropdownOptions
                                .map((value) => InkWell(
                              onTap: () {
                                setState(() {
                                  dropdownValue = value;
                                  if (_overlayEntry != null) {
                                    _overlayEntry!.remove();
                                    _overlayEntry = null;
                                  }
                                  isDropdownOpen = false;
                                });

                                // Call the onDropdownChanged callback if provided
                                widget.onDropdownChanged?.call(value);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: widget.dropdownTextStyle ??
                                      TextStyle(
                                        fontSize: 12,
                                        color: widget.dropdownTextColor ?? Colors.black,
                                      ),
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  );

                  Overlay.of(context)?.insert(_overlayEntry!);
                  setState(() {
                    isDropdownOpen = true;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: widget.dropdownBorderColor ?? Colors.grey),
                  borderRadius: widget.dropdownBorderRadius ?? BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dropdownValue,
                      style: widget.dropdownTextStyle ??
                          TextStyle(color: widget.dropdownTextColor ?? Colors.black, fontSize: 12),
                    ),
                    Icon(
                      isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 20,
                      color: widget.dropdownTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}