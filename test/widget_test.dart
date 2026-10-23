import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wellness_office_landing_page/main.dart';

void main() {
  testWidgets('Landing page loads hero headline', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const GiftWellnessApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Welcome to Wellness Care Centre'), findsOneWidget);
    expect(find.text('100% Confidential'), findsOneWidget);
  });
}
