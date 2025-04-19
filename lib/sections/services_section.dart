import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/service_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:bow_website/widgets/app_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  bool _showAllServices = false;

  final List<Map<String, dynamic>> _services = [
    {
      'title': 'Portfolio/Landing Page',
      'description': 'High-impact page designed for conversions and lead capture...',
      'icon': FontAwesomeIcons.fileLines,
    },
    {
      'title': 'Blog/Content Website',
      'description': 'Engage readers with a seamless, organized blog platform...',
      'icon': FontAwesomeIcons.blog,
    },
    {
      'title': 'LOGO Design',
      'description': 'Transferring the design of your site from Figma to Webflow...',
      'icon': FontAwesomeIcons.paintbrush,
    },
    {
      'title': 'AI Model',
      'description': 'Showcase your creativity through an immersive portfolio experience...',
      'icon': FontAwesomeIcons.brain,
    },
    {
      'title': 'Creative & Educational Services',
      'description': 'Script Writing, Poster Design, Transcription Services...',
      'icon': FontAwesomeIcons.graduationCap,
    },
    {
      'title': 'AI & Multimedia Solutions',
      'description': 'AI Model Training, AI Voice Infusion, Ad Creation (Audio, Image, Video, Shorts, 400+ Unique Sound Effects...',
      'icon': FontAwesomeIcons.robot,
    },
    {
      'title': 'E-commerce Development',
      'description': 'Full-featured online stores with secure payment gateways...',
      'icon': FontAwesomeIcons.cartShopping,
    },
    {
      'title': 'SEO Optimization',
      'description': 'Enhance visibility and drive organic traffic to your website...',
      'icon': FontAwesomeIcons.chartLine,
    },
    {
      'title': 'Custom Web Applications',
      'description': 'Tailored solutions for your specific business needs...',
      'icon': FontAwesomeIcons.code,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final bool isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, DESKTOP);
    
    // Limit displayed services if not showing all
    final displayedServices = _showAllServices 
        ? _services 
        : _services.take(6).toList();
    
    final int crossAxisCount = isMobile 
        ? 1 
        : isTablet 
            ? 2 
            : 3;
    
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
          // Section Title
          Text(
            'Our Services',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: AppDimensions.paddingXL),
          
          // Service Cards Grid
          StaggeredGrid.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: AppDimensions.paddingLarge,
            crossAxisSpacing: AppDimensions.paddingLarge,
            children: displayedServices.map((service) {
              return ServiceCard(
                title: service['title'],
                description: service['description'],
                icon: service['icon'],
              );
            }).toList(),
          ),
          
          // View More button
          if (_services.length > 6) ...[
            const SizedBox(height: AppDimensions.paddingXL),
            Center(
              child: AppButton(
                text: _showAllServices ? 'View Less' : 'View More',
                onPressed: () {
                  setState(() {
                    _showAllServices = !_showAllServices;
                  });
                },
                isPrimary: false,
                height: 40,
              ),
            ),
          ],
        ],
      ),
    );
  }
} 