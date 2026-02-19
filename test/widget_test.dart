import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_shop_ui/main.dart';

void main() {
  testWidgets('Coffee Shop App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const CoffeeShopApp());

    // Verify that the app loads without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}