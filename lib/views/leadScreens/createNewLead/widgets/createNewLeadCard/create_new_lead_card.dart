import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';

class CreateNewLeadScreenCard extends StatefulWidget {
  final String hintText;
  final List<String>? categories;
  final Function(List<String>)? onCategoriesChanged;
  final Function(String)? onCategoryChanged;
  final TextEditingController? controller;
  final bool isMultiSelect;
  final bool allowCustomInput;
  final bool isForDivisions;
  final bool isPincode;
  final Function(String)? onSearch;
  final bool isLoading;
  final List<String>? filteredPincodeList;

  const CreateNewLeadScreenCard({
    Key? key,
    required this.hintText,
    this.categories,
    this.onCategoriesChanged,
    this.onCategoryChanged,
    this.controller,
    this.isMultiSelect = false,
    this.allowCustomInput = false,
    this.isForDivisions = false,
    this.isPincode = false,
    this.onSearch,
    this.isLoading = false,
    this.filteredPincodeList,
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
            borderRadius: BorderRadius.circular(22),
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
                        style:
                        const TextStyle(fontSize: 12, color: Colors.white),
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
                SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: widget.isForDivisions &&
                            _selectedCategories.isNotEmpty
                            ? ''
                            : widget.hintText,
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 9),
                      ),
                      style: const TextStyle(fontSize: 14),
                      onChanged: (text) {
                        _filterCategories(text); // Call the filter function
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
                      child: Container(
                        width: 16,
                        child: Icon(
                          Icons.close,
                          color: AllColors.lighterGrey,
                          size: 16,
                        ),
                      ),
                    ),
                  if (widget.categories != null)
                    GestureDetector(
                      onTap: _toggleDropdownMenu,
                      child: Container(
                        width: 40,
                        child: Icon(Icons.arrow_drop_down_sharp,
                            color: AllColors.lighterGrey),
                      ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredCategories.length,
                        itemBuilder: (context, index) {
                          final category = _filteredCategories[index];
                          final isSelected =
                          _selectedCategories.contains(category);

                          return GestureDetector(
                            onTap: () => _selectCategory(category),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AllColors.mediumPurple
                                    : Colors.transparent,
                              ),
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : AllColors.blackColor,
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
          Center(
            child: CircularProgressIndicator(),
          ),
        if (widget.filteredPincodeList != null)
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.filteredPincodeList!.length,
            itemBuilder: (context, index) {
              final pincode = widget.filteredPincodeList![index];

              return ListTile(
                title: Text(pincode),
                onTap: () {
                  _textController.text = pincode;
                  _isDropdownVisible = false;
                },
              );
            },
          ),
      ],
    );
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
}
