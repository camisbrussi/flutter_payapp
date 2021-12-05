import 'package:flutter/material.dart';
import 'package:payapp/modules/meus_boletos/meus_boletos_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payapp/shared/widgets/boleto_list/boleto_list_widget.dart';

main() {
  MeusBoletosPage controller;

  setUp(() {
    controller = MeusBoletosPage();
  });

  group("Meus Boletos Page Test", () {
    testWidgets("Insert Boleto Page - Init, Title, FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: MeusBoletosPage()));

      expect(find.text("Meus Boletos"), findsOneWidget);
      expect(find.byType(BoletoListWidget), findsOneWidget);
    });
  });

  testWidgets("Meus Boletoso Page - Click FAB", (tester) async {
    await tester.pumpWidget(MaterialApp(home: MeusBoletosPage()));
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.byType(BoletoListWidget), findsNWidgets(2));
  });
}
