import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? iconColor;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.iconColor,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        decoration: BoxDecoration(
          color: AppColors.darkBackground,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
          border: Border.all(
            color: _isHovered 
                ? AppColors.primaryColor 
                : AppColors.darkBackground,
            width: 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingMedium),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
              ),
              child: Icon(
                widget.icon,
                size: 28,
                color: widget.iconColor ?? AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingLarge),
            
            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            
            // Description
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor.withOpacity(0.7),
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ).animate(
        target: _isHovered ? 1 : 0,
      ).scale(
        begin: const Offset(1.0, 1.0),
        end: const Offset(1.05, 1.05),
        duration: 300.ms,
        curve: Curves.easeOut,
      ),
    );
  }
} 