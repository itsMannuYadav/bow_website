import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/feature_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bow_website/widgets/app_button.dart';

class FeaturesSection extends StatefulWidget {
  const FeaturesSection({super.key});

  @override
  State<FeaturesSection> createState() => _FeaturesSectionState();
}

class _FeaturesSectionState extends State<FeaturesSection> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _featuredWorks = [
    {
      'title': 'Clone Any Website',
      'description': 'Pepper: Restaurants; is crafted for pizza lovers, restaurants, and food delivery businesses, combining mouth-watering design with seamless functionality.',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    },
    {
      'title': 'VerveDent : Medical',
      'description': 'Designed for modern dental clinics seeking a balance of professionalism & innovation. Sleek design, user-friendly functionality, and captivating visual elements, all tailored to elevate your online presence.',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    },
    {
      'title': 'Dynamic E-Commerce',
      'description': 'CCommerce is designed to grow with you, no matter the size of your operation. Stop settling for ordinary e-commerce solutions. Take your online store to the next level with CCommerce.',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1523381294911-8d3cead13475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    },
    {
      'title': 'Designer Portfolio',
      'description': 'Perfect for creators and professionals eager to showcase their work in style! Whether you\'re setting up a blog, online store, or portfolio, this template makes the process effortless.',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1545665277-5937489579f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    },
    {
      'title': 'Archi: Real Estate Site',
      'description': 'Discover Archi, a versatile website designed for travel, business, real estate, and more. Perfect for any industry, Archi offers a sleek and professional design to enhance your online presence effortlessly.',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1973&q=80',
    },
    {
      'title': 'Agency Website',
      'description': 'For agencies and businesses such as Digital Marketing and SEO Agency, Creative Agency, Digital Agency, Portfolio, Digital Business, Personal Website etc. Modern, Dark yet & Easy to use',
      'platform': 'Framer',
      'imagePath': 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
          // Section Title
          Align(
            alignment: isMobile ? Alignment.center : Alignment.centerLeft,
            child: Text(
              'Featured Works',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: isMobile ? 28 : 40,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingXL),
          
          // Feature Cards
          if (isMobile) ...[
            // Mobile layout - vertical list of cards
            ...List.generate(_featuredWorks.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.paddingLarge),
                child: FeatureCard(
                  title: _featuredWorks[index]['title'],
                  description: _featuredWorks[index]['description'],
                  imagePath: _featuredWorks[index]['imagePath'],
                  platform: _featuredWorks[index]['platform'],
                  onVisitPressed: () {},
                  isMobile: true,
                ),
              );
            }),
          ] else ...[
            // Desktop Grid
            StaggeredGrid.count(
              crossAxisCount: isTablet ? 2 : 3,
              mainAxisSpacing: AppDimensions.paddingLarge,
              crossAxisSpacing: AppDimensions.paddingLarge,
              children: _featuredWorks.map((work) {
                return FeatureCard(
                  title: work['title'],
                  description: work['description'],
                  imagePath: work['imagePath'],
                  platform: work['platform'],
                  onVisitPressed: () {},
                  isMobile: false,
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
} 