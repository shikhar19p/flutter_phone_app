import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bms_screen_04_gender.dart';

class BmsScreen03Profile extends StatefulWidget {
  const BmsScreen03Profile({super.key});

  @override
  State<BmsScreen03Profile> createState() => _BmsScreen03ProfileState();
}

class _BmsScreen03ProfileState extends State<BmsScreen03Profile> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final TextEditingController _firstNameController = TextEditingController(text: 'Oscar');
  final TextEditingController _lastNameController = TextEditingController(text: 'Sun');
  final TextEditingController _dobController = TextEditingController(text: '09/10/1998');

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            // Background circle
            Positioned(
              left: -126,
              top: -95,
              child: Opacity(
                opacity: 0.08,
                child: Container(
                  width: 282.94,
                  height: 282.94,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF94EA01),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(141.47)),
                    ),
                  ),
                ),
              ),
            ),
            
            SafeArea(
              child: Column(
                children: [
                  // Header with back button and status bar
                  _buildHeader(),
                  
                  // Main content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          
                          // Main heading
                          const Text(
                            'Tell me some details please?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Subtitle
                          const Opacity(
                            opacity: 0.70,
                            child: Text(
                              'This help your friend to, find your rockit account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Profile picture
                          Center(
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFF9FAFB),
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 1.04,
                                    color: Color(0xFFE5E6EB),
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'PROFILE\nPICTURE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Name fields row
                          Row(
                            children: [
                              // First name field
                              Expanded(
                                child: _buildInputField(
                                  label: 'FIRST NAME',
                                  controller: _firstNameController,
                                ),
                              ),
                              
                              const SizedBox(width: 15),
                              
                              // Last name field
                              Expanded(
                                child: _buildInputField(
                                  label: 'LAST NAME',
                                  controller: _lastNameController,
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Date of birth field
                          _buildInputField(
                            label: 'DATE OF BIRTH',
                            controller: _dobController,
                            hasIcon: true,
                          ),
                          
                          const Spacer(),
                          
                          // Continue button
                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: () {
                                HapticFeedback.mediumImpact();
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const BmsScreen04Gender(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                    transitionDuration: const Duration(milliseconds: 300),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA1FF00),
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 104.02,
      child: Stack(
        children: [
          // Status bar
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 390.09,
              height: 45.77,
              child: Stack(
                children: [
                  // Time
                  Positioned(
                    left: 21.84,
                    top: 13.52,
                    child: Container(
                      width: 56.17,
                      height: 21.84,
                      child: const Center(
                        child: Text(
                          '9:41',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.56,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  
                  // Battery
                  Positioned(
                    right: 16,
                    top: 18,
                    child: Row(
                      children: [
                        Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Container(
                          width: 22.89,
                          height: 11.79,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.04, color: Colors.white),
                              borderRadius: BorderRadius.circular(2.77),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.39)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Back button
          Positioned(
            left: 24.97,
            top: 62.41,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.of(context).pop();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.48),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool hasIcon = false,
  }) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: const ShapeDecoration(
        color: Color(0xFFF9FAFB),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.04,
            color: Color(0xFFE5E6EB),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.32)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF9EA3AE),
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.09,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    controller.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ),
                if (hasIcon)
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF9EA3AE),
                    size: 20,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}