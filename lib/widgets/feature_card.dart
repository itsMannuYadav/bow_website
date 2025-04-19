import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/app_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final String platform;
  final VoidCallback onVisitPressed;
  final bool isMobile;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.platform,
    required this.onVisitPressed,
    this.isMobile = false,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBackground,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project image with platform badge
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.grayColor,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: AppColors.whiteColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium,
                      vertical: AppDimensions.paddingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blackBackground.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
                    ),
                    child: Text(
                      widget.platform,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: widget.isMobile
                        ? AppTextStyles.cardTitle.copyWith(fontSize: 20)
                        : AppTextStyles.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.paddingMedium),
                  Text(
                    widget.description,
                    style: widget.isMobile
                        ? AppTextStyles.cardSubtitle.copyWith(fontSize: 14)
                        : AppTextStyles.cardSubtitle,
                    maxLines: widget.isMobile ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.paddingLarge),
                  widget.isMobile
                      ? AppButton(
                          text: 'Visit Now',
                          onPressed: widget.onVisitPressed,
                          isPrimary: true,
                          isSmall: true,
                          width: double.infinity,
                        )
                      : AppButton(
                          text: 'Visit Now',
                          onPressed: widget.onVisitPressed,
                          isPrimary: true,
                          isSmall: true,
                        ),
                ],
              ),
            ),
          ],
        ),
      ).animate(
        target: _isHovered ? 1 : 0,
      ).scale(
        begin: const Offset(1.0, 1.0),
        end: const Offset(1.02, 1.02),
        duration: 300.ms,
        curve: Curves.easeOut,
      ),
    );
  }
} 