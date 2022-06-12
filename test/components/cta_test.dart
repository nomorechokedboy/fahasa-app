// ignore_for_file: null_check_always_fails

import 'package:fahasa_app/components/cta.dart';
import 'package:fahasa_app/containers/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('cta without button', (tester) async {
    const ctaContent = 'There is nothing to tell you!';
    await tester.pumpWidget(const CTA(ctaContent));

    expect(find.text(ctaContent), findsOneWidget);
    expect(find.text('Oops.'), findsOneWidget);
  });

  testWidgets('cta with button', (tester) async {
    const ctaContent = 'There is nothing to tell you!';
    const buttonLabel = 'Go shopping now';
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: const CTA(ctaContent),
        navigatorObservers: [mockObserver],
      ),
    );

    final ctaButton = find.text(buttonLabel);

    expect(find.text(ctaContent), findsOneWidget);
    expect(find.text('Oops.'), findsOneWidget);
    expect(ctaButton, findsOneWidget);

    await tester.tap(ctaButton);
    await tester.pumpAndSettle();

    expect(find.byType(MainScreen), findsOneWidget);
    verify(mockObserver.didPush(any!, any));
  });
}
