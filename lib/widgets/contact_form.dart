import 'package:flutter/material.dart';
import 'package:bow_website/utils/constants.dart';
import 'package:bow_website/widgets/app_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  
  String _selectedBudget = '';
  final List<String> _budgetOptions = [
    'Less than 10,000 Rs',
    '10,000 - 20,000 Rs',
    '20,000 - 40,000 Rs',
    '40,000 - 80,000 Rs',
    'More than 80,000 Rs',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name field
          _buildTextField(
            controller: _nameController,
            labelText: 'Name*',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          
          // Phone field
          _buildTextField(
            controller: _phoneController,
            labelText: 'Phone Number*',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          
          // Email field
          _buildTextField(
            controller: _emailController,
            labelText: 'Email*',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          
          // Budget dropdown
          _buildDropdown(),
          const SizedBox(height: AppDimensions.paddingLarge),
          
          // Message field
          _buildTextField(
            controller: _messageController,
            labelText: 'Message*',
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.paddingXL),
          
          // Submit button
          AppButton(
            text: 'SUBMIT',
            onPressed: _submitForm,
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.whiteColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        filled: true,
        fillColor: AppColors.darkBackground,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedBudget.isEmpty ? null : _selectedBudget,
      hint: Text(
        'Budget*',
        style: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.7),
        ),
      ),
      dropdownColor: AppColors.darkBackground,
      style: TextStyle(
        color: AppColors.whiteColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        filled: true,
        fillColor: AppColors.darkBackground,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedBudget = newValue;
          });
        }
      },
      items: _budgetOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select your budget';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted successfully!'),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    }
  }
} 