import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Navbar extends StatefulWidget {
  final Function(int) onNavItemClicked;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.onNavItemClicked,
    this.currentIndex = 0,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMobileMenuOpen = false;

  final List<String> _navItems = [
    'Home',
    'Projects',
    'Testimonials',
    'Service',
    'About Us',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile 
                ? AppDimensions.paddingLarge 
                : AppDimensions.paddingXXL,
            vertical: AppDimensions.paddingMedium,
          ),
          color: AppColors.blackBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Text(
                'SMS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              
              // Desktop Navigation
              if (!isMobile) ...[
                Row(
                  children: List.generate(
                    _navItems.length,
                    (index) => _buildNavItem(index, isMobile),
                  ),
                ),
              ] else ...[
                // Mobile menu button
                IconButton(
                  icon: Icon(
                    _isMobileMenuOpen 
                        ? Icons.close 
                        : Icons.menu,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isMobileMenuOpen = !_isMobileMenuOpen;
                    });
                  },
                ),
              ],
            ],
          ),
        ),
        
        // Mobile menu dropdown
        if (isMobile && _isMobileMenuOpen)
          Container(
            width: double.infinity,
            color: AppColors.darkBackground,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _navItems.length,
                (index) => _buildMobileNavItem(index),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileNavItem(int index) {
    final bool isSelected = widget.currentIndex == index;
    
    return InkWell(
      onTap: () {
        widget.onNavItemClicked(index);
        setState(() {
          _isMobileMenuOpen = false; // Close menu after selection
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingLarge,
          vertical: AppDimensions.paddingMedium,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.blackBackground,
              width: 1,
            ),
          ),
        ),
        child: Text(
          _navItems[index],
          style: TextStyle(
            color: isSelected 
                ? AppColors.primaryColor 
                : AppColors.whiteColor,
            fontWeight: isSelected 
                ? FontWeight.bold 
                : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, bool isMobile) {
    final bool isSelected = widget.currentIndex == index;
    
    return InkWell(
      onTap: () => widget.onNavItemClicked(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primaryColor.withOpacity(0.1) 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
        ),
        child: Text(
          _navItems[index],
          style: TextStyle(
            color: isSelected 
                ? AppColors.primaryColor 
                : AppColors.whiteColor,
            fontWeight: isSelected 
                ? FontWeight.bold 
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
} 