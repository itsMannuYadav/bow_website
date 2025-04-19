import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/faq_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? _expandedIndex;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'What services do you offer?',
      'answer': 'We offer a comprehensive range of services including website design and development, e-commerce solutions, landing pages, portfolio websites, blog creation, SEO optimization, and custom web applications. Additionally, we provide creative services such as logo design, AI model training, multimedia solutions, and educational content creation.',
    },
    {
      'question': 'How can a website help me attract more clients?',
      'answer': 'A professional website serves as your digital storefront, establishing credibility and trust with potential clients. Our websites are strategically designed to showcase your services, highlight your expertise, and convert visitors into clients. We incorporate effective calls-to-action, user-friendly navigation, and responsive design to ensure optimal performance across all devices, helping you attract and retain high-value clients.',
    },
    {
      'question': 'How much will my project cost?',
      'answer': 'Project costs vary based on the scope, complexity, and specific requirements of your project. We offer customized solutions to match your needs and budget. After understanding your requirements during an initial consultation, we provide a detailed quote. Our pricing is transparent, with no hidden fees, and we offer flexible payment options to accommodate various budgets.',
    },
    {
      'question': 'How do I get a quote for my project?',
      'answer': 'Getting a quote is simple! Use the contact form on our website or book a call directly. Provide as much detail as possible about your project requirements to receive an accurate estimate. Our team will review your needs and get back to you promptly with a comprehensive proposal outlining timeline, deliverables, and pricing.',
    },
    {
      'question': 'What are the payment terms for a project?',
      'answer': 'Our standard payment structure typically includes a 50% upfront deposit to secure your project in our queue, with the remaining balance due upon project completion before the final launch. For larger projects, we can arrange milestone-based payments. We accept various payment methods including bank transfers, credit cards, and digital payment platforms for your convenience.',
    },
    {
      'question': 'How do we get started on a project?',
      'answer': 'The process begins with an initial consultation to understand your goals and requirements. After agreeing on the project scope and terms, we\'ll collect necessary materials (content, branding elements, etc.) and begin development based on an approved timeline. Throughout the project, we maintain regular communication and provide opportunities for feedback and revisions before finalizing and launching your website.',
    },
    {
      'question': 'How long does a project take?',
      'answer': 'Project timelines depend on complexity and scope. Simple landing pages can be completed in 1-2 weeks, while comprehensive websites with custom functionality may take 4-8 weeks. E-commerce sites and complex web applications typically require 8-12 weeks. We\'ll provide a specific timeline during our consultation based on your project requirements and collaborate with you to establish realistic deadlines.',
    },
  ];

  void _toggleFAQ(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    
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
            alignment: Alignment.center,
            child: Text(
              'Frequently Asked‍ Questions',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: isMobile ? 28 : 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Align(
            alignment: Alignment.center,
            child: Text(
              'We will be happy to provide any information you need before start working on your project. Just ask.',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: AppColors.whiteColor.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingXL),
          
          // FAQ Items
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 800,
              ),
              child: Column(
                children: List.generate(_faqs.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: isMobile 
                        ? AppDimensions.paddingMedium 
                        : AppDimensions.paddingLarge),
                    child: FAQItem(
                      question: _faqs[index]['question']!,
                      answer: _faqs[index]['answer']!,
                      isExpanded: _expandedIndex == index,
                      onToggle: () => _toggleFAQ(index),
                      isMobile: isMobile,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 