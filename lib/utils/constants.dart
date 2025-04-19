import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
class AppColors {
  static const Color primaryColor = Color(0xFFFF004D);
  static const Color accentColor = Color(0xFFFF387F);
  static const Color darkBackground = Color(0xFF191919);
  static const Color blackBackground = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color grayColor = Color(0xFF777777);
  static const Color lightGrayColor = Color(0xFFDDDDDD);
}

// Text Styles
class AppTextStyles {
  static TextStyle heroTitle = GoogleFonts.inter(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  
  static TextStyle heroSubtitle = GoogleFonts.inter(
    fontSize: 18,
    color: AppColors.whiteColor,
    height: 1.5,
  );
  
  static TextStyle sectionTitle = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  
  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  
  static TextStyle cardSubtitle = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.whiteColor.withOpacity(0.8),
  );
  
  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  
  static TextStyle navLinkText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

// Dimensions
class AppDimensions {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;
  
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
}

// Assets paths
class AppAssets {
  static const String logoPath = 'assets/images/logo.png';
  static const String profileImagePath = 'assets/images/profile.png';
}

// Social media links
class SocialLinks {
  static const String twitter = 'https://twitter.com/';
  static const String linkedin = 'https://linkedin.com/in/';
  static const String instagram = 'https://instagram.com/';
  static const String facebook = 'https://facebook.com/';
  static const String github = 'https://github.com/';
} 