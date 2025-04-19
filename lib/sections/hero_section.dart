import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/app_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final bool isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, DESKTOP);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile 
            ? AppDimensions.paddingLarge 
            : AppDimensions.paddingXXL,
        vertical: isMobile 
            ? AppDimensions.paddingXL 
            : AppDimensions.paddingXXL * 1.5,
      ),
      color: AppColors.blackBackground,
      child: Column(
        children: [
          // Hero Content
          if (isMobile) ...[
            _buildHeroContent(context, isMobile),
            const SizedBox(height: AppDimensions.paddingXL),
            _buildSkillsAndSocial(context, isMobile),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero content
                Expanded(
                  flex: 3,
                  child: _buildHeroContent(context, isMobile),
                ),
                const SizedBox(width: AppDimensions.paddingXL),
                
                // Skills and social
                Expanded(
                  flex: 2,
                  child: _buildSkillsAndSocial(context, isMobile),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isMobile) {
    final titleStyle = isMobile
        ? AppTextStyles.heroTitle.copyWith(fontSize: 32)
        : AppTextStyles.heroTitle;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated Title
        RichText(
          text: TextSpan(
            text: "Hii, I'm ",
            style: titleStyle,
            children: [
              TextSpan(
                text: "Mannu Yadav",
                style: titleStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Text(
          "From Bharat",
          style: titleStyle,
        ),
        const SizedBox(height: AppDimensions.paddingLarge),
        
        // Description
        Text(
          "We're a team of skilled freelancers crafting websites that don't just look great - they work. Designed to build trust, attract high-paying clients, and set you apart, our sites blend strategy, psychology, and seamless UX. Professional, fast, and affordable—let's create something amazing together! 🚀",
          style: AppTextStyles.heroSubtitle.copyWith(
            fontSize: isMobile ? 16 : 18,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingXL),
        
        // Call-to-action buttons
        if (isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppButton(
                text: 'Book a Call',
                onPressed: () {},
                isPrimary: true,
                width: double.infinity,
              ),
              const SizedBox(height: AppDimensions.paddingMedium),
              AppButton(
                text: 'Our Portfolio',
                onPressed: () {},
                isPrimary: false,
                width: double.infinity,
              ),
            ],
          )
        else
          Row(
            children: [
              AppButton(
                text: 'Book a Call',
                onPressed: () {},
                isPrimary: true,
              ),
              const SizedBox(width: AppDimensions.paddingMedium),
              AppButton(
                text: 'Our Portfolio',
                onPressed: () {},
                isPrimary: false,
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildSkillsAndSocial(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Our Top Skills
        Text(
          'Our Top Skills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        Wrap(
          spacing: AppDimensions.paddingMedium,
          runSpacing: AppDimensions.paddingMedium,
          children: [
            _buildSkillChip('Automatic Updates'),
            _buildSkillChip('Consistency in Design'),
            _buildSkillChip('Advanced CMS'),
            _buildSkillChip('Responsive Website'),
            _buildSkillChip('Quality Delivery'),
            _buildSkillChip('Free Domain'),
          ],
        ),
        const SizedBox(height: AppDimensions.paddingXL),
        
        // Connect With Us
        Text(
          'Connect With Us',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        Wrap(
          spacing: AppDimensions.paddingMedium,
          runSpacing: AppDimensions.paddingMedium,
          children: [
            _buildSocialIcon(FontAwesomeIcons.twitter, SocialLinks.twitter),
            _buildSocialIcon(FontAwesomeIcons.linkedin, SocialLinks.linkedin),
            _buildSocialIcon(FontAwesomeIcons.facebook, SocialLinks.facebook),
            _buildSocialIcon(FontAwesomeIcons.instagram, SocialLinks.instagram),
            _buildSocialIcon(FontAwesomeIcons.github, SocialLinks.github),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.darkBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.whiteColor,
          size: 20,
        ),
      ),
    );
  }
} 