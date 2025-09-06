import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bms_screen_02_fixed.dart';
import 'bms_screen_07_dashboard.dart';

class BmsScreenImproved extends StatefulWidget {
  const BmsScreenImproved({super.key});

  @override
  State<BmsScreenImproved> createState() => _BmsScreenImprovedState();
}

class _BmsScreenImprovedState extends State<BmsScreenImproved> 
    with TickerProviderStateMixin {
  
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController, 
      curve: Curves.easeOutBack,
    ));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    _slideController.forward();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF1A1A1A),
              Color(0xFF0F1419),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Player image background
            Positioned(
              top: 50,
              right: 20,
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PLAYER IMAGE\nREPLACE HERE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            
            // Main content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    // Status bar
                    _buildStatusBar(),
                    
                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              
                              // App title
                              _buildAppTitle(),
                              
                              const SizedBox(height: 60),
                              
                              // Chat bubbles section
                              Expanded(
                                child: _buildChatSection(),
                              ),
                              
                              const SizedBox(height: 30),
                              
                              // Center message
                              _buildCenterMessage(),
                              
                              const SizedBox(height: 50),
                              
                              // Action buttons
                              _buildActionButtons(),
                              
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '9:41',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Text',
          ),
        ),
        Row(
          children: [
            Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Icon(Icons.wifi, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Container(
              width: 24,
              height: 12,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppTitle() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: Container(
            width: 200,
            height: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF94EA01).withOpacity(0.3),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'LOGO LOCATION\nReplace with your logo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildChatSection() {
    return Stack(
      children: [
        // Chat bubble 1 (top left) - Green
        Positioned(
          left: 20,
          top: 50,
          child: _buildChatBubble(
            size: 45,
            borderColor: Color(0xFFA2FF04),
            message: "Let's play...",
            isLeft: true,
            delay: 0,
          ),
        ),
        
        // Chat bubble 2 (top right) - Yellow
        Positioned(
          right: 30,
          top: 20,
          child: _buildChatBubble(
            size: 60,
            borderColor: Color(0xFFFFC403),
            message: "Ready to game!",
            isLeft: false,
            delay: 300,
          ),
        ),
        
        // Chat bubble 3 (middle left) - Orange
        Positioned(
          left: 30,
          top: 140,
          child: _buildChatBubble(
            size: 55,
            borderColor: Color(0xFFFF720E),
            message: "I'm in!",
            isLeft: true,
            delay: 600,
          ),
        ),
        
        // Chat bubble 4 (bottom right) - Red
        Positioned(
          right: 20,
          top: 200,
          child: _buildChatBubble(
            size: 50,
            borderColor: Color(0xFFFF0E3A),
            message: "Count me in",
            isLeft: false,
            delay: 900,
          ),
        ),
      ],
    );
  }

  Widget _buildChatBubble({
    required double size,
    required Color borderColor,
    required String message,
    required bool isLeft,
    required int delay,
  }) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800 + delay),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Column(
            crossAxisAlignment: isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              // Avatar
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      borderColor.withOpacity(0.8),
                      borderColor,
                    ],
                  ),
                  border: Border.all(color: borderColor, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: borderColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: size * 0.5,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Message bubble
              Container(
                constraints: BoxConstraints(maxWidth: 120),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(isLeft ? 2 : 12),
                    bottomRight: Radius.circular(isLeft ? 12 : 2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCenterMessage() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Wanna play today?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
                fontFamily: 'Inter',
                shadows: [
                  Shadow(
                    color: Color(0xFF94EA01),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Get Started Button
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (0.05 * _pulseAnimation.value),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF94EA01),
                      Color(0xFFA1FF00),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF94EA01).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const BmsScreen02Fixed(),
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
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        
        const SizedBox(height: 20),
        
        // Skip Button
        TextButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const BmsScreen07Dashboard(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
          child: Text(
            'SKIP',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}