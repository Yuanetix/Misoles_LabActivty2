import 'package:flutter_test/flutter_test.dart';
import 'package:misoles_labactivity2/main.dart';

void main() {
  testWidgets('Water Tracker UI renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Water Tracker'), findsOneWidget);
    expect(find.text('Stay Hydrated!'), findsOneWidget);
    expect(find.text('Build a healthy daily habit'), findsOneWidget);
    expect(find.text('Daily Water Goal'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('glasses per day'), findsOneWidget);
    expect(find.text('Drink water regularly'), findsOneWidget);
    expect(find.text('Bring your water bottle'), findsOneWidget);
    expect(find.text('Every glass counts!'), findsOneWidget);
  });
}
