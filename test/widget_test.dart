import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color/application/application.dart';

import 'package:random_color/res/app_keys.dart';
import 'package:random_color/res/string_consts.dart';

void main() {
  testWidgets('color is changing', (WidgetTester tester) async {
    await tester.pumpWidget(Application());

    expect(find.text(kHey), findsOneWidget);

    var scaffold = find.byKey(AppKeys.kHomeScaffold, skipOffstage: false).evaluate().first.widget as Scaffold;

    Color oldColor = scaffold.backgroundColor;

    await tester.tap(find.byKey(AppKeys.kBackgroundInkWell));
    await tester.pump();

    var newScaffold = find.byKey(AppKeys.kHomeScaffold, skipOffstage: false).evaluate().first.widget as Scaffold;

    expect(newScaffold.backgroundColor, isNot(oldColor));
  });
}
