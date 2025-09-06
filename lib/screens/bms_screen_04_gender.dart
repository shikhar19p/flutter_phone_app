import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bms_screen_05_interests.dart';

class BmsScreen04Gender extends StatefulWidget {
  const BmsScreen04Gender({super.key});

  @override
  State<BmsScreen04Gender> createState() => _BmsScreen04GenderState();
}

class _BmsScreen04GenderState extends State<BmsScreen04Gender> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  String? selectedGender = 'Male';

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
              left: -135.23,
              top: -95.70,
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
                          const SizedBox(
                            width: 340.16,
                            child: Text(
                              'What is \nyour gender?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Subtitle
                          const SizedBox(
                            width: 271.50,
                            child: Opacity(
                              opacity: 0.70,
                              child: Text(
                                'This help us find you more relevant content',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Gender selection cards
                          Expanded(
                            child: Row(
                              children: [
                                // Male option
                                Expanded(
                                  child: _buildGenderCard(
                                    gender: 'Male',
                                    isSelected: selectedGender == 'Male',
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 'Male';
                                      });
                                      HapticFeedback.lightImpact();
                                    },
                                  ),
                                ),
                                
                                const SizedBox(width: 24),
                                
                                // Female option
                                Expanded(
                                  child: _buildGenderCard(
                                    gender: 'Female',
                                    isSelected: selectedGender == 'Female',
                                    onTap: () {
                                      setState(() {
                                        selectedGender = 'Female';
                                      });
                                      HapticFeedback.lightImpact();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 60),
                          
                          // Continue button
                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: selectedGender != null ? () {
                                HapticFeedback.mediumImpact();
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const BmsScreen05Interests(),
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
                              } : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedGender != null 
                                  ? const Color(0xFFA1FF00) 
                                  : Colors.grey,
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
                  
                  // Battery and signals
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
                  
                  // Progress indicator
                  Positioned(
                    left: 277.74,
                    top: 87.38,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF2A2A2A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.08)),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 29.13,
                            height: 8.32,
                            decoration: const BoxDecoration(color: Color(0xFF94EA01)),
                          ),
                          Container(
                            width: 29.13,
                            height: 8.32,
                            decoration: const BoxDecoration(color: Color(0xFF94EA01)),
                          ),
                          Container(
                            width: 29.13,
                            height: 8.32,
                            decoration: const BoxDecoration(color: Color(0xFF2A2A2A)),
                          ),
                        ],
                      ),
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

  Widget _buildGenderCard({
    required String gender,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 158,
        height: 228,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: const Color(0xFFE0E0E0),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Stack(
          children: [
            // Background opacity overlay for unselected state
            if (!isSelected && gender == 'Male')
              Positioned(
                left: 0,
                top: 0,
                child: Opacity(
                  opacity: 0.20,
                  child: Container(
                    width: 158,
                    height: 228,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.24)),
                      ),
                    ),
                  ),
                ),
              ),
            
            // Gender label
            Positioned(
              left: gender == 'Male' ? 59.25 : 47.82,
              top: gender == 'Male' ? 16.13 : 18.73,
              child: Text(
                gender,
                style: TextStyle(
                  color: isSelected && gender == 'Male' 
                    ? const Color(0xFF94EA01) 
                    : const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
            ),
            
            // Image placeholder
            Positioned(
              left: gender == 'Male' ? 0.04 : -18.01,
              top: gender == 'Male' ? 0.13 : 44.13,
              child: Container(
                width: gender == 'Male' ? 158 : 190,
                height: gender == 'Male' ? 228 : 256,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${gender.toUpperCase()}\nIMAGE\nHERE',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}