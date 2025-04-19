import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/testimonial_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _testimonials = [
    {
      'quote': 'Mannu Yadav & team are exceptional web developers who created a visually stunning and easy-to-use website for my astrological practice. His team was responsive, patient, and open to feedback throughout the process. Highly recommended for anyone in need of a professional web developer who can bring their vision to life.',
      'clientName': 'Kunal Chaturvedi',
      'clientPosition': 'Founder: Open Notes',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?portrait',
      'rating': 5.0,
    },
    {
      'quote': 'I am impressed by Siddarth & team\'s in-depth knowledge and ability to translate my ideas into a functional and visually appealing website. They were patient with my revisions and always prioritized my satisfaction. I highly recommend them for anyone seeking a professional and talented developer.',
      'clientName': 'Krishh',
      'clientPosition': 'Founder: Finsy',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?man',
      'rating': 5.0,
    },
    {
      'quote': 'I work with many Website developers for the past 10 years and it\'s hard to find someone with this level of skill and strict attention to detail. He was excellent. Did a perfect job and actually exceeded my expectations. I will hire this team again.',
      'clientName': 'Akash Kumar',
      'clientPosition': 'Co-Founder: Young Leaders Global',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?professional',
      'rating': 5.0,
    },
    {
      'quote': 'I\'ve worked with numerous Website developers in my career, and Mannu Yadav & team are truly in a league of their own. Thier mastery of the platform and ability to fine-tune every detail sets them apart. MannuY not only delivered a stellar website but also exceeded my expectations by incorporating innovative solutions.',
      'clientName': 'Puspraj Yadav',
      'clientPosition': 'Founder & CEO: Nexus Tycoon',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?ceo',
      'rating': 5.0,
    },
    {
      'quote': 'I\'m happy with the website Shubham & team created for my company. It\'s professional, user-friendly, and effectively showcases our services. Team was responsive and a pleasure to work with. Highly recommended!',
      'clientName': 'Abhishek Ojha',
      'clientPosition': 'Secretary: Sundarbans IITM',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?indian',
      'rating': 5.0,
    },
    {
      'quote': 'I have been working with freelance website developers for the past decade, and it\'s not often that I come across someone with such a high level of skill and an unwavering commitment to detail. Sidd & team truly stands out in this regard. They delivered an exceptional job.',
      'clientName': 'Virendra Jain',
      'clientPosition': 'Founder & CEO: Get Set Rocket',
      'clientImageUrl': 'https://source.unsplash.com/random/100x100/?businessman',
      'rating': 5.0,
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
              'What Our Clients Say',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: isMobile ? 28 : 40,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingXL),
          
          // Testimonial Cards
          if (isMobile) ...[
            // Mobile layout - vertical list of testimonials
            ...List.generate(_testimonials.length > 3 ? 3 : _testimonials.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.paddingLarge),
                child: TestimonialCard(
                  quote: _testimonials[index]['quote'],
                  clientName: _testimonials[index]['clientName'],
                  clientPosition: _testimonials[index]['clientPosition'],
                  clientImageUrl: _testimonials[index]['clientImageUrl'],
                  rating: _testimonials[index]['rating'],
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
              children: _testimonials.map((testimonial) {
                return TestimonialCard(
                  quote: testimonial['quote'],
                  clientName: testimonial['clientName'],
                  clientPosition: testimonial['clientPosition'],
                  clientImageUrl: testimonial['clientImageUrl'],
                  rating: testimonial['rating'],
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