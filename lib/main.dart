import 'package:flutter/material.dart';
import 'package:bow_website/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const BusinessOfWisdom());
}

class BusinessOfWisdom extends StatelessWidget {
  const BusinessOfWisdom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business of Wisdom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF004D),
          primary: const Color(0xFFFF004D),
          secondary: const Color(0xFF191919),
          background: Colors.black,
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          const Breakpoint(start: 601, end: 900, name: TABLET),
          const Breakpoint(start: 901, end: 1200, name: DESKTOP),
          const Breakpoint(start: 1201, end: double.infinity, name: 'XL'),
        ],
      ),
      home: const HomeScreen(),
    );
  }
}
