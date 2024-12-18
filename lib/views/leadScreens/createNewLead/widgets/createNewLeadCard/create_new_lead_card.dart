import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../utils/appColors/app_colors.dart';

class CreateNewLeadScreenCard extends StatefulWidget {
  final String hintText;
  final List<String>? categories;
  final Function(List<String>)? onCategoriesChanged;
  final Function(String)? onCategoryChanged;
  final TextEditingController? controller;
  final bool isMultiSelect;
  final bool isDateField; // New parameter to distinguish date fields
  final bool allowCustomInput;
  final bool isForDivisions;
  final bool isPincode;
  final Function(String)? onSearch;
  final bool isLoading;
  final List<String>? filteredPincodeList;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final BorderRadius? allowCustomBorderInput; // Change type to BorderRadius?




  const CreateNewLeadScreenCard({

    Key? key,
    required this.hintText,
    this.categories,
    this.onCategoriesChanged,
    this.onCategoryChanged,
    this.isDateField = false,
    this.controller,
    this.isMultiSelect = false,
    this.allowCustomInput = false,
    this.isForDivisions = false,
    this.isPincode = false,
    this.onSearch,
    this.isLoading = false,
    this.filteredPincodeList,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.allowCustomBorderInput, // Now accepts BorderRadius



  }) : super(key: key);

  @override
  _CreateNewLeadScreenCardState createState() =>
      _CreateNewLeadScreenCardState();
}

class _CreateNewLeadScreenCardState extends State<CreateNewLeadScreenCard> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  List<String> _selectedCategories = [];
  bool _isDropdownVisible = false;
  late TextEditingController _textController;
  List<String> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _filteredCategories = widget.categories ?? [];
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _textController.dispose();
    }
    super.dispose();
  }

  void _toggleDropdownMenu() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      if (widget.isMultiSelect) {
        if (_selectedCategories.contains(category)) {
          _selectedCategories.remove(category);
        } else {
          _selectedCategories.add(category);
        }
        widget.onCategoriesChanged?.call(_selectedCategories);
      } else {
        _selectedCategories = [category];
        widget.onCategoryChanged?.call(category);
      }
      _updateTextController();
      _isDropdownVisible = false;
    });
  }

  void _updateTextController() {
    if (!widget.isForDivisions) {
      _textController.text = _selectedCategories.join(', ');
    }
  }

  void _filterCategories(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredCategories = widget.categories ?? [];
      });
    } else {
      setState(() {
        _filteredCategories = (widget.categories ?? [])
            .where((category) =>
            category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AllColors.mediumPurple, // Header background color
              onPrimary: Colors.white, // Header text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _textController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _removeCategory(String category) {
    setState(() {
      _selectedCategories.remove(category);
      _updateTextController();

      if (widget.isMultiSelect) {
        widget.onCategoriesChanged?.call(_selectedCategories);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isFocused ? AllColors.mediumPurple : AllColors.lightGrey,
              width: _isFocused ? 1.0 : 0.3,
            ),
            color: AllColors.whiteColor,
            borderRadius: widget.allowCustomBorderInput ?? BorderRadius.circular(22), // Corrected line
          ),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isForDivisions && _selectedCategories.isNotEmpty)
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  alignment: WrapAlignment.start,
                  children: _selectedCategories.map((category) {
                    return Chip(
                      label: Text(
                        category,
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      backgroundColor: AllColors.mediumPurple,
                      deleteIcon: const Icon(Icons.close,
                          size: 16, color: Colors.white),
                      onDeleted: () => _removeCategory(category),
                      visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.005,
                      ),
                    );
                  }).toList(),
                ),
              if (widget.isForDivisions && _selectedCategories.isNotEmpty)
                const SizedBox(height: 8),
              Row(
                children: [
                  if (widget.prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: widget.prefixIcon!,
                    ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        // suffixIcon: widget.suffixIcon != null
                        //     ? IconButton(
                        //   icon: Icon(Icons.close,color: Colors.grey,),
                        //   onPressed: widget.onSuffixPressed,
                        // )
                        //     : null,
                        hintText: widget.isDateField
                            ? 'Select a date'
                            : (widget.isForDivisions && _selectedCategories.isNotEmpty
                            ? ''
                            : widget.hintText),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 9.0,
                        ),
                      ),
                      readOnly: widget.isDateField,
                      onTap: widget.isDateField ? () => _selectDate(context) : null,
                      style: const TextStyle(fontSize: 14.0),
                      onChanged: (text) {
                        _filterCategories(text);
                        if (widget.allowCustomInput) {
                          if (!widget.isMultiSelect) {
                            widget.onCategoryChanged?.call(text);
                          }
                          if (widget.isPincode) {
                            widget.onSearch?.call(text);
                          }
                        }
                      },
                    ),
                  ),
                  if (_selectedCategories.isNotEmpty && widget.isMultiSelect)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategories.clear();
                        });
                      },
                      child: const Icon(Icons.close, size: 16),
                    ),
                  if (widget.categories != null)
                    GestureDetector(
                      onTap: _toggleDropdownMenu,
                      child: const Icon(Icons.arrow_drop_down_sharp),
                    ),
                ],
              )
            ],
          ),
        ),
        if (_isDropdownVisible)
          Column(
            children: [
              SizedBox(height: Get.height / 60),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AllColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredCategories.length,
                        itemBuilder: (context, index) {
                          final category = _filteredCategories[index];
                          final isSelected = _selectedCategories.contains(category);

                          return GestureDetector(
                            onTap: () => _selectCategory(category),
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: isSelected ? AllColors.mediumPurple : Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : AllColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        if (widget.isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
        if (widget.filteredPincodeList != null && widget.filteredPincodeList!.isEmpty)
          Center(
            child: Text(
              'No Results Found!',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
      ],
    );
  }
}