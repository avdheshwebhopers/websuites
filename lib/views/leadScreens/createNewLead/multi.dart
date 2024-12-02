import 'package:flutter/material.dart';

class CreateNewLeadMultiSelectCard extends StatefulWidget {
  final String hintText;
  final List<String> categories;
  final Function(List<String>) onCategoriesChanged;

  const CreateNewLeadMultiSelectCard({
    Key? key,
    required this.hintText,
    required this.categories,
    required this.onCategoriesChanged,
  }) : super(key: key);

  @override
  _CreateNewLeadMultiSelectCardState createState() => _CreateNewLeadMultiSelectCardState();
}

class _CreateNewLeadMultiSelectCardState extends State<CreateNewLeadMultiSelectCard> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMultiSelect(context);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedCategories.isEmpty
                    ? widget.hintText
                    : selectedCategories.join(', '),
                style: TextStyle(
                  color: selectedCategories.isEmpty ? Colors.grey : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _showMultiSelect(BuildContext context) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: widget.categories, selectedItems: selectedCategories);
      },
    );

    if (results != null) {
      setState(() {
        selectedCategories = results;
      });
      widget.onCategoriesChanged(selectedCategories);
    }
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;

  const MultiSelect({Key? key, required this.items, required this.selectedItems}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Items'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Submit'),
        ),
      ],
    );
  }
}