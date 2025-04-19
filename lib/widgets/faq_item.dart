import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final Function() onToggle;
  final bool isMobile;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onToggle,
    this.isMobile = false,
  });

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onToggle,
        child: Container(
          margin: EdgeInsets.only(
            bottom: widget.isMobile 
                ? AppDimensions.paddingSmall 
                : AppDimensions.paddingMedium
          ),
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
            border: Border.all(
              color: _isHovered || widget.isExpanded
                  ? AppColors.primaryColor
                  : AppColors.darkBackground,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question
              Padding(
                padding: EdgeInsets.all(
                  widget.isMobile 
                      ? AppDimensions.paddingMedium 
                      : AppDimensions.paddingLarge
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                          fontSize: widget.isMobile ? 16 : 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppDimensions.paddingMedium),
                    AnimatedRotation(
                      turns: widget.isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: _isHovered || widget.isExpanded
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        size: widget.isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Answer
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimensions.borderRadiusMedium),
                  bottomRight: Radius.circular(AppDimensions.borderRadiusMedium),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: widget.isExpanded ? null : 0,
                  child: widget.isExpanded
                      ? Container(
                          padding: EdgeInsets.only(
                            left: widget.isMobile 
                                ? AppDimensions.paddingMedium 
                                : AppDimensions.paddingLarge,
                            right: widget.isMobile 
                                ? AppDimensions.paddingMedium 
                                : AppDimensions.paddingLarge,
                            bottom: widget.isMobile 
                                ? AppDimensions.paddingMedium 
                                : AppDimensions.paddingLarge,
                          ),
                          color: AppColors.blackBackground,
                          child: Text(
                            widget.answer,
                            style: TextStyle(
                              fontSize: widget.isMobile ? 14 : 16,
                              color: AppColors.whiteColor.withOpacity(0.8),
                              height: 1.5,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate(
      target: _isHovered ? 1 : 0,
    ).elevation(
      begin: 0,
      end: 10,
      duration: 300.ms,
      curve: Curves.easeInOut,
    );
  }
} 