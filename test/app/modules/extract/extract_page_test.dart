import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payapp/modules/extract/extract_page.dart';
import 'package:payapp/shared/widgets/boleto_list/boleto_list_widget.dart';

main() {
  ExtractPage controller;

  setUp(() {
    controller = ExtractPage();
  });

  group("Extract Page Test", () {
    testWidgets("Extract Page - Init, Title, FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExtractPage()));

      expect(find.text("Meus extratos"), findsOneWidget);
      expect(find.byType(BoletoListWidget), findsOneWidget);
    });

    testWidgets("Extract Page - Click FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExtractPage()));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.byType(SingleChildScrollView), findsNWidgets(1));
      expect(find.byType(BoletoListWidget), findsNWidgets(1));
    });
  });
}
