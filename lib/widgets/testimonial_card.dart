import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestimonialCard extends StatefulWidget {
  final String quote;
  final String clientName;
  final String clientPosition;
  final String clientImageUrl;
  final double rating;
  final bool isMobile;

  const TestimonialCard({
    super.key,
    required this.quote,
    required this.clientName,
    required this.clientPosition,
    required this.clientImageUrl,
    this.rating = 5.0,
    this.isMobile = false,
  });

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(
          widget.isMobile 
              ? AppDimensions.paddingMedium 
              : AppDimensions.paddingLarge
        ),
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
            // Rating
            Row(
              children: [
                Text(
                  widget.rating.toString(),
                  style: TextStyle(
                    fontSize: widget.isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(width: AppDimensions.paddingMedium),
                ...List.generate(5, (index) {
                  return Icon(
                    FontAwesomeIcons.solidStar,
                    size: widget.isMobile ? 12 : 14,
                    color: AppColors.primaryColor,
                  );
                }),
              ],
            ),
            SizedBox(height: widget.isMobile 
                ? AppDimensions.paddingMedium 
                : AppDimensions.paddingLarge
            ),
            
            // Quote
            Text(
              widget.quote,
              style: TextStyle(
                fontSize: widget.isMobile ? 14 : 16,
                color: AppColors.whiteColor.withOpacity(0.9),
                height: 1.5,
              ),
              maxLines: widget.isMobile ? 4 : 6,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: widget.isMobile 
                ? AppDimensions.paddingMedium 
                : AppDimensions.paddingLarge
            ),
            
            // Client info
            Row(
              children: [
                CircleAvatar(
                  radius: widget.isMobile ? 20 : 25,
                  backgroundImage: NetworkImage(widget.clientImageUrl),
                  onBackgroundImageError: (exception, stackTrace) {},
                  child: widget.clientImageUrl.isEmpty
                      ? Icon(
                          Icons.person,
                          color: AppColors.whiteColor,
                          size: widget.isMobile ? 25 : 30,
                        )
                      : null,
                ),
                const SizedBox(width: AppDimensions.paddingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.clientName,
                        style: TextStyle(
                          fontSize: widget.isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.clientPosition,
                        style: TextStyle(
                          fontSize: widget.isMobile ? 12 : 14,
                          color: AppColors.whiteColor.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ).animate(
        target: _isHovered ? 1 : 0,
      ).scale(
        begin: const Offset(1.0, 1.0),
        end: const Offset(1.03, 1.03),
        duration: 300.ms,
        curve: Curves.easeOut,
      ),
    );
  }
} 