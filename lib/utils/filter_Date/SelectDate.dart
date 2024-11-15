import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../appColors/app_colors.dart';

class SelectDate extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(DateTime?, DateTime?)? onDateRangeSelected;

  const SelectDate({
    Key? key,
    required this.hintText,
    this.controller,
    this.onDateRangeSelected,
  }) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isDropdownVisible = false;
  late TextEditingController _textController;
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _focusedDay;
  String? _selectedOption; // Track the selected option

  final List<String> _dateRangeOptions = [
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
    'This Month',
    'Last Month',
    'Custom Range',
  ];

  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _focusedDay = DateTime.now();
    _selectDateRange('Today');
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _textController.dispose();
    }
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectDateRange(String option) {
    DateTime now = DateTime.now();

    setState(() {
      _selectedOption = option; // Update selected option
      switch (option) {
        case 'Today':
          _startDate = _endDate = now;
          break;
        case 'Yesterday':
          _startDate = _endDate = now.subtract(const Duration(days: 1));
          break;
        case 'Last 7 Days':
          _endDate = now;
          _startDate = now.subtract(const Duration(days: 6));
          break;
        case 'Last 30 Days':
          _endDate = now;
          _startDate = now.subtract(const Duration(days: 29));
          break;
        case 'This Month':
          _startDate = DateTime(now.year, now.month, 1);
          _endDate = DateTime(now.year, now.month + 1, 0);
          break;
        case 'Last Month':
          _startDate = DateTime(now.year, now.month - 1, 1);
          _endDate = DateTime(now.year, now.month, 0);
          break;
        case 'Custom Range':
          return;
      }

      _updateTextFieldValue();
      if (option != 'Custom Range') {
        _isDropdownVisible = false;
        widget.onDateRangeSelected?.call(_startDate, _endDate);
      }
    });
  }

  void _updateTextFieldValue() {
    if (_startDate != null && _endDate != null) {
      String startDateStr = DateFormat('yyyy-MM-dd').format(_startDate!);
      String endDateStr = DateFormat('yyyy-MM-dd').format(_endDate!);

      _textController.text = _startDate == _endDate
          ? startDateStr
          : '$startDateStr to $endDateStr';
    } else {
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isFocused ? Colors.blue : Colors.grey,
              width: _isFocused ? 1.0 : 0.3,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _toggleDropdown,
                child: AbsorbPointer(
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 3
                      ),
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              if (_isDropdownVisible) ...[
                Column(
                  children: _dateRangeOptions.map((option) {
                    final isSelected = option == _selectedOption; // Check if the option is selected
                    return InkWell(
                      onTap: () => _selectDateRange(option),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0
                        ),
                        color: isSelected ? AllColors.mediumPurple : Colors.transparent, // Set background color
                        child: Text(
                          option,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black, // Change text color based on selection
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (_dateRangeOptions.contains('Custom Range'))
                  TableCalendar(
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    focusedDay: _focusedDay!,
                    calendarFormat: CalendarFormat.month,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    selectedDayPredicate: (day) => day == _startDate || day == _endDate,
                    rangeStartDay: _startDate,
                    rangeEndDay: _endDate,
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      todayDecoration: BoxDecoration(
                        color: AllColors.mediumPurple, // Background color for today's date
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AllColors.mediumPurple, // Background color for selected date
                        shape: BoxShape.circle,
                      ),
                      rangeHighlightColor: AllColors.lightPurple, // Background color for selected range
                      defaultDecoration: BoxDecoration(
                        color: Colors.white, // Background color for non-selected days
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _startDate = _endDate = selectedDay;
                        _updateTextFieldValue();
                        widget.onDateRangeSelected?.call(_startDate, _endDate);
                      });
                    },
                    onRangeSelected: (start, end, focusedDay) {
                      setState(() {
                        _startDate = start;
                        _endDate = end;
                        _focusedDay = focusedDay;
                        if (_startDate != null && _endDate != null) {
                          _updateTextFieldValue();
                          _isDropdownVisible = false;
                          widget.onDateRangeSelected?.call(_startDate, _endDate);
                        }
                      });
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}