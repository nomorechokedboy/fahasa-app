// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fahasa_app/app/app.dart';
import 'package:fahasa_app/constants/globals.dart';
import 'package:fahasa_app/containers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Go to notifications tab', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    final searchIcon = find.byIcon(Icons.search);
    final notificationIcon = find.byIcon(Icons.notifications_rounded);

    expect(searchIcon, findsOneWidget);
    expect(notificationIcon, findsOneWidget);

    await tester.tap(notificationIcon);
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text(notificationTitle), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
  });

  testWidgets('Go to orders tab', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.subject_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.subject_rounded));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text(orderTitle), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
  });

  testWidgets('Go to settings tab', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.account_circle_rounded));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byType(Settings), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
  });
}
