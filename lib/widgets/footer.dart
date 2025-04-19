import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile 
            ? AppDimensions.paddingLarge 
            : AppDimensions.paddingXXL,
        vertical: AppDimensions.paddingXL,
      ),
      color: AppColors.darkBackground,
      child: Column(
        children: [
          // Footer content
          Wrap(
            spacing: AppDimensions.paddingXL,
            runSpacing: AppDimensions.paddingXL,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              // Copyright info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '© 2025. All rights reserved by Business of Wisdom',
                    style: TextStyle(
                      color: AppColors.whiteColor.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              
              // Social links
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.twitter,
                    url: SocialLinks.twitter,
                  ),
                  const SizedBox(width: AppDimensions.paddingMedium),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.linkedin,
                    url: SocialLinks.linkedin,
                  ),
                  const SizedBox(width: AppDimensions.paddingMedium),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.instagram,
                    url: SocialLinks.instagram,
                  ),
                  const SizedBox(width: AppDimensions.paddingMedium),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.facebook,
                    url: SocialLinks.facebook,
                  ),
                  const SizedBox(width: AppDimensions.paddingMedium),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.github,
                    url: SocialLinks.github,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
  }) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: 18,
        ),
      ),
    );
  }
} 