import 'package:flutter/material.dart';
import 'package:websuites/Resources/components/Cards/CustomerListScreen_Card/customerListScreen_card.dart';
import 'package:websuites/Resources/components/Cards/CutomerActivitiesScreen_card/cutomer_activities_screen_card.dart';
import '../Assets/app_fonts.dart';
import '../components/app_colors.dart';



class AppTextStyle{
  //============================================================================

  // LOGIN SCREEN

  static loginScreen(context, String message) {
    return Text(message,
      // maxLines: 1,
      style: TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: AppColors.lightGrey, //AppColors.lightGrey
      ));
  }

  static login(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          fontFamily: AppFonts.nunitoRegular,
        ));
  }

  static loginEmail(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: const TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ));
  }

  static loginPassword(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: const TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ));
  }

  static loginRememberMe(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: const TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),);
  }

  static loginForgotPassword(context, String message) {
    return Text(message,
      // maxLines: 1,
      style: TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.buttonColor,// AppColors.buttonColor
      ),);
  }

  static loginNewOn(context, String message) {
    return Text(message,
      // maxLines: 1,
      style: const TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),);
  }

  static loginPurchaseNow(context, String message) {
    return Text(message,
      // maxLines: 1,
      style: TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.buttonColor,// AppColors.buttonColor
      ),);
  }

  //============================================================================

  // FORGOT PASSWORD

  static ForgotForgotPassword(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.nunitoRegular,
          color: AppColors.welcomeColor, //AppColors.WelcomeColor
        ));
  }

  static ForgotEnterYour(context, String message) {
    return Text(message,
        // maxLines: 1,
        style: TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 12,
          color: AppColors.grey, //AppColors.grey
        ));
  }

  static ForgotBacktoLogin(context, String message) {
     return Text(message,
         // maxLines: 1,
         style: const
         TextStyle(
           fontFamily: AppFonts.nunitoRegular,
           fontSize: 10,
           fontWeight: FontWeight.w300,

         )
     );
   }

  //============================================================================

  //OTP SCREEN

  static OtpWelcomeTo(context, String message) {
    return Text(message,
        // maxLines: 1,
        style:
        TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppColors.welcomeColor,//AppColors.WelcomeColor
        ),
    );
  }

  static OtpWeTextedYou(context, String message) {
    return Text(message,
      style:
      TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.grey,//AppColors.grey
      ),
    );
  }

  static OtpTheCodeTo(context, String message) {
    return Text(message,
      style:
      TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.grey,
      ),
    );
  }

  static OtpEnterCode(context, String message) {
    return Text(message,
      style:
      TextStyle(
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.blackColor,
      ),
    );
  }

  static OtpResendOtp(context, String message) {
    return Text(message,
      style: const
      TextStyle(
        fontSize: 10,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
      )
    );
  }

  //============================================================================

// HOME SCREEN

  static HomeTaskPerformance(context, String message) {
    return Text(message,
         style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeTaskDate(context, String message) {
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeCompleted(context, String message){
    return Text(message,
      style:
      const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.nunitoRegular,
        fontSize:10,
      ),
    );
  }

  static HomeTaskProgress(context, String message){
    return Text(message,
      style:
      const TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static HomeLatestTask(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeSeeAll(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.vividPurple,
      ),
    );
  }

  static HomeLeadTypeCount(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeLeadTypeDate(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeLatestCustomer(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeLatestCustomerSeeAll(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.vividPurple,
      ),
    );
  }

  static HomeLeadSource(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeLeadSourceList(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.grey,
      ),
    );
  }

  static HomeLeadSourceChart(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        color: AppColors.vividBlue,
      ),
    );
  }

  static HomeTransactions(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    );
  }

  static HomeTransactionsSeeAll(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w300,
        color: AppColors.vividPurple,
      ),
    );
  }

  //============================================================================

//WELCOME TO COMPANY NAME

  static Welcome_Title(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.nunitoRegular,
        color: AppColors.welcomeColor,
      ),
    );
  }

  static Welcome_VerifyYourIdentity(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.nunitoRegular,
          color: AppColors.grey
      ),
    );
  }

  static Welcome_Email(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.nunitoRegular,
          color: AppColors.blackColor
      ),
    );
  }

//==============================================================================
//Lead List Screen

  static LeadList_leadList(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.nunitoRegular,
          fontSize:17,
          color: AppColors.blackColor
      ),
    );
  }

  static LeadList_filter(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey
      ),
    );
  }

  static LeadList_Lastweek(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),
    );
  }

//==============================================================================
//Upcoming Screen

  static Upcoming_upcoming(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.whiteColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w400
      ),
    );
  }

  static Upcoming_InProgress(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w400
      ),
    );
  }

  static Upcoming_completed(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w400
      ),
    );
  }

  static Upcoming_Upcoming2(context, String message){
    return Text(message,
      style:
      TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
      ),
    );
  }

  static Upcoming_filter(context, String message){
    return Text(message,
      style:
      TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrey,
      ),
    );
  }

  static Upcoming_Lastweek(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),
    );
  }

//==============================================================================
//Create New Lead Screen

  static CreateNewLead_createNewLead(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor
      ),
    );
  }

  static CreateNewLead_ImportLeads(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static CreateNewLead_standardFields(context, String message){
    return Text(message,
      style:
      TextStyle(
        color: AppColors.vividPurple,
        fontWeight: FontWeight.w600,
        fontSize: 15,
        fontFamily: AppFonts.nunitoRegular,
      ),
    );
  }

  static CreateNewLead_firstName(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_lastName(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_phoneNumber(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_add(context, String message){
    return Text(message,
      style:
      TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor
      ),
    );
  }

  static CreateNewLead_email(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_address(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_city_pincode(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_state(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Country(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Source(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Assigned_lead_to(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Organisation(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Divisions(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_ProductCategories(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Requirement(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_CustomFields(context, String message){
    return Text(message,
      style:
      TextStyle(
        color: AppColors.vividPurple,
        fontWeight: FontWeight.w600,
        fontSize: 15,
        fontFamily: AppFonts.nunitoRegular,
      ),
    );
  }

  static CreateNewLead_Pincode(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Designation(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Website(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_GSTNumber(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_CustomerDivision(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_IndustryType(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_leadCategory(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_ContactPersonName(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_ContactPersonNumber(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_CompleteAddress(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Industry(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static CreateNewLead_Create(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static CreateNewLead_Reset(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  //==============================================================================
  // Search Google Leads

  static SearchGoogle_searchGoogleLeads(context, String message){
    return Text(message,
      style:
      TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.nunitoRegular,
        fontSize: 16,
      ),
    );
  }

  static SearchGoogle_FindActive1(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.vividPurple,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 16,
          fontWeight: FontWeight.w700
      ),
    );
  }

  static SearchGoogle_FindActive2(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.vividPurple,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static SearchGoogle_SearchLead(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static SearchGoogle_ByLocation(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static SearchGoogle_Search2(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w500
      ),
    );
  }

  //============================================================================
//Lead Activities

  static LeadActivity_LeadList(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static LeadActivity_Filter(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.lightGrey,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 13
      ),
    );
  }

  static LeadActivity_Details(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static LeadActivity_REMARK(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontSize: 12,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w500
      ),
    );
  }

  static LeadActivity_REMINDER_0N(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontSize: 12,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w500
      ),
    );
  }

  //============================================================================
  // My Team Lead

  static TeamLead_MyTeamLead(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.nunitoRegular
      ),
    );
  }

  static TeamLead_Filter(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.lightGrey,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 14
      ),
    );
  }

  static TeamLead_TLead(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

  static TeamLead_Cold(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

  static TeamLead_hot(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

  static TeamLead_FollowUp(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

  static TeamLead_Dead(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

  //============================================================================
// Trash Leads

  static TrashLeads_TrashLeads(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.nunitoRegular,
          fontSize: 17
      ),
    );
  }

  static TrashLeads_Filter(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.lightGrey,
          fontSize: 14,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400
      ),
    );
  }

  static TrashLeads_Remark(context, String message){
    return Text(message,
      style:
      TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 12
      ),
    );
  }

  //============================================================================

// Lead Master

static LeadMaster_leadMaster (context, String message) {
    return Text(message,
      style: TextStyle(
          color: AppColors.blackColor,
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w700,
          fontSize: 17
      ),
    );
}

static LeadMaster_addLeadType (context, String message) {
    return Text(message,
    style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.nunitoRegular
    ),
    );
}

static LeadMaster_Types (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.whiteColor,
      fontFamily: AppFonts.nunitoRegular,
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),
    );
}

static LeadMaster_Source (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.nunitoRegular,
      fontSize: 14,
      fontWeight: FontWeight.w400
    ),
    );
}

static LeadMaster_Status (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.nunitoRegular,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    );
}

static LeadMaster_AvailableLeadStatus (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.nunitoRegular
    ),);
}

static Leadmaster_subType (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.nunitoRegular,
      fontWeight: FontWeight.w500,
      fontSize: 12
    ),);
}

//==============================================================================

//Customer List

static CustomerList_customer (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.nunitoRegular,
    ),
    );
}

static CustomerList_customer2 (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.whiteColor,
      fontSize: 12,
      fontFamily: AppFonts.nunitoRegular,
      fontWeight: FontWeight.w400
    ),);
}

//==============================================================================

//Customer Activities

static CustomerActvities_leadList (context, String message) {
    return Text(message, style: TextStyle(
        color: AppColors.blackColor,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w700,
        fontSize: 17
    ),
    );
  }

  static CustomerActivities_filter (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.lightGrey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.nunitoRegular
    ),
    );
  }

  static CustomerActivities_Details (context, String message) {
    return Text(message, style: TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.nunitoRegular,
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),);
  }


  static CustomerActivities_Remark (context, String message) {
    return Text(message, style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.nunitoRegular
    ),
    );
  }

  static CustomerActivities_ReminderOn (context, String message) {
    return Text(message, style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.nunitoRegular
    ),
    );
  }

































































}