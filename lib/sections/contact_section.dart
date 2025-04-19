import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/contact_form.dart';
import 'package:bow_website/widgets/app_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
        vertical: AppDimensions.paddingXXL,
      ),
      color: AppColors.blackBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile) ...[
            // Mobile layout
            _buildProfileSection(context),
            const SizedBox(height: AppDimensions.paddingXL),
            _buildContactForm(context),
          ] else ...[
            // Desktop layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section
                Expanded(
                  flex: 4,
                  child: _buildProfileSection(context),
                ),
                const SizedBox(width: AppDimensions.paddingXL),
                
                // Contact form
                Expanded(
                  flex: 6,
                  child: _buildContactForm(context),
                ),
              ],
            ),
          ],
          
          // Call to action
          const SizedBox(height: AppDimensions.paddingXXL),
          _buildCallToAction(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image
        Container(
          width: isMobile ? 150 : 200,
          height: isMobile ? 150 : 200,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                'https://source.unsplash.com/random/400x400/?portrait,indian,man',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.paddingLarge),
        
        // Name
        Text(
          'Mannu Yadav',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        
        // Position
        Text(
          'I am available for freelance work. Connect with me via email or social media.',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor.withOpacity(0.8),
            height: 1.5,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        
        // Email
        Row(
          children: [
            Text(
              'Email: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            InkWell(
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'contact@businessofwisdom.com',
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
              child: Text(
                'contact@businessofwisdom.com',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.paddingSmall),
        Text(
          'OR',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(height: AppDimensions.paddingSmall),
        InkWell(
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'businessofwisdom.official@gmail.com',
            );
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            }
          },
          child: Text(
            'businessofwisdom.official@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        
        // Social Media Icons
        const SizedBox(height: AppDimensions.paddingLarge),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.twitter, SocialLinks.twitter),
            const SizedBox(width: AppDimensions.paddingMedium),
            _buildSocialIcon(FontAwesomeIcons.linkedin, SocialLinks.linkedin),
            const SizedBox(width: AppDimensions.paddingMedium),
            _buildSocialIcon(FontAwesomeIcons.facebook, SocialLinks.facebook),
            const SizedBox(width: AppDimensions.paddingMedium),
            _buildSocialIcon(FontAwesomeIcons.instagram, SocialLinks.instagram),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ContactForm(),
      ],
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingXL,
        vertical: AppDimensions.paddingXL,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
      ),
      child: Column(
        children: [
          Text(
            'Facing urgent website challenges?',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Text(
            'Book a call now to receive immediate assistance and my guidance tailored to your needs.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: AppColors.whiteColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          AppButton(
            text: 'Book a Call',
            onPressed: () {},
            isPrimary: true,
          ),
        ],
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