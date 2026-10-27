import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WaterTrackerScreen(),
    );
  }
}

class WaterTrackerScreen extends StatelessWidget {
  const WaterTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBCE3F5),
      appBar: AppBar(
        title: const Text(
          'Water Tracker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4C66A4),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Solid Geometric Water Droplet
                const WaterDropWidget(
                  width: 44,
                  height: 62,
                  color: Color(0xFF3B7EDB),
                ),

                const SizedBox(height: 18),

                // Main Title
                const Text(
                  'Stay Hydrated!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                    letterSpacing: -0.3,
                  ),
                ),

                const SizedBox(height: 6),

                // Subtitle
                const Text(
                  'Build a healthy daily habit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF596D80),
                  ),
                ),

                const SizedBox(height: 22),

                // Daily Water Goal Card
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Daily Water Goal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF334658),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '8',
                        style: TextStyle(
                          fontSize: 82,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C4373),
                          height: 1.05,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'glasses per day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF596D80),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Button 1: Drink water regularly
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    color: const Color(0xFF4EA8EB),
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        alignment: Alignment.center,
                        child: const Text(
                          'Drink water regularly',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF103663),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Button 2: Bring your water bottle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    color: const Color(0xFF4EA8EB),
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        alignment: Alignment.center,
                        child: const Text(
                          'Bring your water bottle',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF103663),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Footer Text
                const Text(
                  'Every glass counts!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF50718C),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painted teardrop water drop matching the exact reference geometry.
class WaterDropWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const WaterDropWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _WaterDropPainter(color),
    );
  }
}

class _WaterDropPainter extends CustomPainter {
  final Color color;

  _WaterDropPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final w = size.width;
    final h = size.height;
    final r = w / 2;
    final yc = h - r;
    final d = yc;

    final alpha = math.asin(r / d);
    final cosAlpha = math.cos(alpha);
    final sinAlpha = math.sin(alpha);

    final pRightX = w / 2 + r * cosAlpha;
    final pRightY = yc - r * sinAlpha;

    final startAngle = -alpha;
    final sweepAngle = math.pi + 2 * alpha;

    final path = Path();
    path.moveTo(w / 2, 0);
    path.lineTo(pRightX, pRightY);
    path.arcTo(
      Rect.fromCircle(center: Offset(w / 2, yc), radius: r),
      startAngle,
      sweepAngle,
      false,
    );
    path.lineTo(w / 2, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaterDropPainter oldDelegate) =>
      oldDelegate.color != color;
}
