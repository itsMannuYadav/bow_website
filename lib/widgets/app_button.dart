import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool fullWidth;
  final double height;
  final double? width;
  final EdgeInsets padding;
  final bool isSmall;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.fullWidth = false,
    this.height = 48.0,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
    this.isSmall = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.height,
        width: widget.width ?? (widget.fullWidth ? double.infinity : null),
        decoration: BoxDecoration(
          color: widget.isPrimary 
              ? _isHovered 
                  ? AppColors.accentColor 
                  : AppColors.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
          border: !widget.isPrimary
              ? Border.all(
                  color: _isHovered 
                      ? AppColors.primaryColor 
                      : AppColors.whiteColor,
                  width: 2.0,
                )
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
            child: Padding(
              padding: widget.padding,
              child: Center(
                child: Text(
                  widget.text,
                  style: widget.isSmall 
                      ? AppTextStyles.buttonText.copyWith(fontSize: 14.0)
                      : AppTextStyles.buttonText,
                ),
              ),
            ),
          ),
        ),
      ).animate(
        target: _isHovered ? 1 : 0,
      ).scale(
        begin: const Offset(1.0, 1.0),
        end: const Offset(1.05, 1.05),
      ),
    );
  }
} 