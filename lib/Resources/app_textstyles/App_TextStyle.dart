import 'package:flutter/material.dart';
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








































}