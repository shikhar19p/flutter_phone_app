import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bms_screen_07_dashboard.dart';

class BmsScreen06Loading extends StatefulWidget {
  const BmsScreen06Loading({super.key});

  @override
  State<BmsScreen06Loading> createState() => _BmsScreen06LoadingState();
}

class _BmsScreen06LoadingState extends State<BmsScreen06Loading> 
    with TickerProviderStateMixin {
  late AnimationController _spinController;
  late Animation<double> _spinAnimation;

  @override
  void initState() {
    super.initState();
    
    _spinController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _spinAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _spinController, curve: Curves.linear),
    );

    _spinController.repeat();

    // Auto-navigate to dashboard after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const BmsScreen07Dashboard(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Stack(
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
          
          // Status bar
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 390,
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
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '9:4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.56,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.29,
                                ),
                              ),
                              TextSpan(
                                text: '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.56,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  
                  // Battery
                  Positioned(
                    right: 16,
                    top: 18.03,
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
          
          // Bottom indicator
          Positioned(
            left: 0,
            top: 809.30,
            child: Container(
              width: 390.09,
              height: 35.37,
              child: Stack(
                children: [
                  Positioned(
                    left: 125.30,
                    top: 20.44,
                    child: Container(
                      width: 139.39,
                      height: 5.20,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(104.02)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spinning loading circle
                AnimatedBuilder(
                  animation: _spinAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _spinAnimation.value * 2 * 3.14159,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF2A2A2A),
                              Color(0xFFA1FF00),
                            ],
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF151515),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 40),
                
                // Loading text
                const SizedBox(
                  width: 83,
                  height: 34,
                  child: Text(
                    'Preparing\naccount..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Next arrow button
                GestureDetector(
                  onTap: () {
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
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA1FF00),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFA1FF00).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}