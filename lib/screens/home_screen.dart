import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/navbar.dart';
import 'package:bow_website/widgets/footer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:bow_website/sections/hero_section.dart';
import 'package:bow_website/sections/features_section.dart';
import 'package:bow_website/sections/testimonials_section.dart';
import 'package:bow_website/sections/services_section.dart';
import 'package:bow_website/sections/faq_section.dart';
import 'package:bow_website/sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentNavIndex = 0;
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final RenderBox renderBox = _sectionKeys[index].currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    
    _scrollController.animateTo(
      _scrollController.offset + position.dy - 80, // 80 for navbar height
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    
    setState(() {
      _currentNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Add extra space at the top for fixed navbar
                SizedBox(height: isMobile ? 70 : 80),
                
                // Hero Section
                HeroSection(key: _sectionKeys[0]),
                
                // Features Section
                FeaturesSection(key: _sectionKeys[1]),
                
                // Testimonials Section
                TestimonialsSection(key: _sectionKeys[2]),
                
                // Services Section
                ServicesSection(key: _sectionKeys[3]),
                
                // FAQ Section
                FAQSection(key: _sectionKeys[4]),
                
                // Contact Section
                ContactSection(key: _sectionKeys[5]),
                
                // Footer
                const Footer(),
              ],
            ),
          ),
          
          // Fixed Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              currentIndex: _currentNavIndex,
              onNavItemClicked: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
} 