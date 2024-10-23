import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';

class LeadMasterScreenCard extends StatelessWidget {
  final String title;
  final String activity;
  final String date;
  final List<String> subtypes;
  final VoidCallback? onAddSubtype;
  final Function(String)? onEditSubtype;

  const LeadMasterScreenCard({
    Key? key,
    required this.title,
    required this.activity,
    required this.date,
    this.subtypes = const [],
    this.onAddSubtype,
    this.onEditSubtype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AllColors.blackColor.withOpacity(0.06),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildDateSection(),
          const Divider(thickness: 0.2),
          _buildSubtypesSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Get.width < 600 ? 13 : 16,
              color: AllColors.blackColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),

        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AllColors.lightPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            activity,
            style: TextStyle(
              color: AllColors.vividPurple,
              fontSize: Get.width < 600 ? 12 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSection() {
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: 16,
          color: AllColors.vividPurple,
        ),
        const SizedBox(width: 5),
        Text(
          date,
          style: TextStyle(
            color: AllColors.grey,
            fontWeight: FontWeight.w400,
            fontSize: Get.width < 600 ? 12 : 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtypesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextStyles.w500_universal(
              fontSize: Get.width < 600 ? 13 : 16,
              color: AllColors.blackColor,
              context,
              Strings.subtypes,
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_right_alt,
              size: 18,
              color: AllColors.lightGrey,
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (subtypes.isEmpty)
          _buildEmptySubtypes()
        else
          _buildSubtypesList(),
      ],
    );
  }

  Widget _buildEmptySubtypes() {
    return Row(
      children: [
        Text(
          'No subtypes available',
          style: TextStyle(
            color: AllColors.grey,
            fontSize: Get.width < 600 ? 12 : 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        if (onAddSubtype != null)
          InkWell(
            onTap: onAddSubtype,
            child: Icon(
              Icons.add_circle_outline,
              size: 20,
              color: AllColors.lightGrey,
            ),
          ),
      ],
    );
  }

  Widget _buildSubtypesList() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...subtypes.map((subtype) => _buildSubtypeChip(subtype)),
        if (onAddSubtype != null)
          InkWell(
            onTap: onAddSubtype,
            child: Icon(
              Icons.add_circle_outline,
              size: 20,
              color: AllColors.lightGrey,
            ),
          ),
      ],
    );
  }

  Widget _buildSubtypeChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AllColors.textField2,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AllColors.darkGrey,
              fontWeight: FontWeight.w400,
              fontSize: Get.width < 600 ? 12 : 14,
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () => onEditSubtype?.call(label),
            child: Icon(
              Icons.edit,
              size: 14,
              color: AllColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}